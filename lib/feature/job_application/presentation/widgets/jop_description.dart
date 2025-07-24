import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/constant/app_functions.dart';
import 'package:weather/core/di/service_locator.dart';
import 'package:weather/feature/job_application/data/models/job_details_model.dart';
import 'package:weather/feature/job_application/presentation/logic/get_job_details/get_job_details_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_job_details/get_job_details_state.dart';

enum ListType { responsibilities, requirements }

class JopDescription extends StatelessWidget {
  const JopDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetJobDetailsCubit, GetJobDetailsState>(
      builder: (context, state) {
        if (state is GetJobDetailsLoading) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(color: Colors.red),
            ),
          );
        }

        if (state is GetJobDetailsError) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 48),
                  SizedBox(height: 8),
                  Text(
                    'error_loading_job_details'.tr(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    state.message,
                    style: TextStyle(color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        if (state is GetJobDetailsLoaded) {
          final jobDetails = state.jobDetails.result;

          if (jobDetails == null) {
            return Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'no_job_details_available'.tr(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          return _buildJobDetailsCard(jobDetails);
        }

        // Default state
        return Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "job_description".tr(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        );
      },
    );
  }

  Widget _buildJobDetailsCard(JobDetails jobDetails) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Job Title Header
            _buildSectionHeader(
              icon: Icons.work,
              title:
                  jobDetails.jobTitle ??
                  jobDetails.jobTitleAlias ??
                  'Job Title',
              isMainTitle: true,
            ),

            SizedBox(height: 20),

            // Job Description
            if (jobDetails.jobDescription != null &&
                jobDetails.jobDescription!.isNotEmpty) ...[
              _buildJobDescriptionSections(jobDetails.jobDescription!),
              SizedBox(height: 20),
            ],

            // Job Information
            _buildJobInfo(jobDetails),

            // // Questions
            // if (jobDetails.question1 != null ||
            //     jobDetails.question2 != null ||
            //     jobDetails.question3 != null) ...[
            //   SizedBox(height: 20),
            //   _buildQuestionsSection(jobDetails),
            // ],
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required IconData icon,
    required String title,
    bool isMainTitle = false,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.red, size: isMainTitle ? 28 : 24),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: isMainTitle ? 22 : 18,
              fontWeight: FontWeight.bold,
              color: isMainTitle ? Colors.red : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildJobDescriptionSections(String htmlDescription) {
    // Parse HTML content and separate sections
    final sections = _parseHtmlDescription(htmlDescription);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Description Section
        if (sections['description'] != null &&
            sections['description']!.isNotEmpty) ...[
          _buildSectionHeader(
            icon: Icons.description,
            title: 'job_description'.tr(),
          ),
          SizedBox(height: 8),
          _buildDescriptionContent(sections['description']!),
          SizedBox(height: 16),
        ],

        // Responsibilities Section
        if (sections['responsibilities'] != null &&
            sections['responsibilities']!.isNotEmpty) ...[
          _buildSectionHeader(
            icon: Icons.task_alt,
            title: 'responsibilities'.tr(),
          ),
          SizedBox(height: 8),
          _buildListContent(
            sections['responsibilities']!,
            Colors.blue,
            ListType.responsibilities,
          ),
          SizedBox(height: 16),
        ],

        // Requirements Section
        if (sections['requirements'] != null &&
            sections['requirements']!.isNotEmpty) ...[
          _buildSectionHeader(
            icon: Icons.checklist,
            title: 'requirements'.tr(),
          ),
          SizedBox(height: 8),
          _buildListContent(
            sections['requirements']!,
            Colors.green,
            ListType.requirements,
          ),
        ],
      ],
    );
  }

  Map<String, String> _parseHtmlDescription(String htmlContent) {
    Map<String, String> sections = {
      'description': '',
      'responsibilities': '',
      'requirements': '',
    };

    // Remove HTML tags but keep line breaks for structure
    String cleanContent = getit<AppFunctions>().cleanHtmlTextWithStructure(
      htmlContent,
      preserveParagraphs: true,
      preserveLists: true,
      preserveLineBreaks: true,
      convertListItems: true,
      listItemPrefix: '• ',
    );

    // Split content by sections
    List<String> lines = cleanContent
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();

    String currentSection = 'description';
    List<String> descriptionLines = [];
    List<String> responsibilityLines = [];
    List<String> requirementLines = [];

    for (String line in lines) {
      String lowerLine = line.toLowerCase();

      if (lowerLine.contains('responsibilities:') ||
          lowerLine.contains('responsibility:')) {
        currentSection = 'responsibilities';
        continue;
      } else if (lowerLine.contains('requirements:') ||
          lowerLine.contains('requirement:')) {
        currentSection = 'requirements';
        continue;
      }

      switch (currentSection) {
        case 'description':
          if (!lowerLine.contains('responsibilities:') &&
              !lowerLine.contains('requirements:')) {
            descriptionLines.add(line);
          }
          break;
        case 'responsibilities':
          if (!lowerLine.contains('requirements:')) {
            responsibilityLines.add(line);
          }
          break;
        case 'requirements':
          requirementLines.add(line);
          break;
      }
    }

    sections['description'] = descriptionLines.join('\n').trim();
    sections['responsibilities'] = responsibilityLines.join('\n').trim();
    sections['requirements'] = requirementLines.join('\n').trim();

    return sections;
  }

  Widget _buildListContent(
    String content,
    Color accentColor, [
    ListType? listType,
  ]) {
    // Split content into individual items
    List<String> items = content
        .split('\n')
        .map((item) => item.trim())
        .where((item) => item.isNotEmpty)
        .map((item) {
          // Clean up bullet points
          if (item.startsWith('•')) {
            return item.substring(1).trim();
          } else if (item.startsWith('-') || item.startsWith('*')) {
            return item.substring(1).trim();
          }
          return item;
        })
        .where((item) => item.isNotEmpty && item.length > 2)
        .toList();

    if (items.isEmpty) {
      return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: accentColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: accentColor.withOpacity(0.3)),
        ),
        child: Text(
          content,
          style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: accentColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map((item) => _buildListItem(item, accentColor, listType))
            .toList(),
      ),
    );
  }

  Widget _buildListItem(String item, Color accentColor, [ListType? listType]) {
    IconData iconData;

    // Choose icon based on list type
    switch (listType) {
      case ListType.responsibilities:
        iconData = Icons.assignment_turned_in;
        break;
      case ListType.requirements:
        iconData = Icons.verified;
        break;
      default:
        iconData = Icons.circle;
    }

    return Builder(
      builder: (context) {
        bool isArabic = context.locale.languageCode == 'ar';
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon with proper RTL/LTR support
              Container(
                margin: EdgeInsets.only(
                  top: 2,
                  right: isArabic ? 0 : 8,
                  left: isArabic ? 8 : 0,
                ),
                child: Icon(iconData, size: 18, color: accentColor),
              ),
              Expanded(
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDescriptionContent(String description) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Text(
        description,
        style: TextStyle(fontSize: 15, height: 1.6, color: Colors.black87),
      ),
    );
  }

 

  Widget _buildJobInfo(JobDetails jobDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          icon: Icons.info_outline,
          title: 'job_information'.tr(),
        ),
        SizedBox(height: 12),

        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green[200]!),
          ),
          child: Column(
            children: [
              // Qualification
              if (jobDetails.fndQualificationLKp?.nameEn != null)
                _buildInfoRow(
                  icon: Icons.school,
                  label: 'qualification'.tr(),
                  value: jobDetails.fndQualificationLKp!.nameEn!,
                ),
              // Job Type
              if (jobDetails.fndJObTypeLKp?.nameEn != null)
                _buildInfoRow(
                  icon: Icons.work_outline,
                  label: 'job_type'.tr(),
                  value: jobDetails.fndJObTypeLKp!.nameEn!,
                ),
              // Experience
              if (jobDetails.experience != null &&
                  jobDetails.experience!.isNotEmpty)
                _buildInfoRow(
                  icon: Icons.timeline,
                  label: 'experience_required'.tr(),
                  value: jobDetails.experience!,
                ),
              //country
              if (jobDetails.fndJobLocationkpIdLkp!.nameEn != null &&
                  jobDetails.fndJobLocationkpIdLkp!.nameEn!.isNotEmpty)
                _buildInfoRow(
                  icon: Icons.public,
                  label: 'country'.tr(),
                  value: jobDetails.fndJobLocationkpIdLkp!.nameEn!,
                ),
              // Location
              if (jobDetails.jobLocation != null &&
                  jobDetails.jobLocation!.isNotEmpty)
                _buildInfoRow(
                  icon: Icons.location_on,
                  label: 'location'.tr(),
                  value: jobDetails.jobLocation!,
                ),
              //working hours
              if (jobDetails.from != null && jobDetails.to != null)
                _buildInfoRow(
                  icon: Icons.access_time,
                  label: 'working_hours'.tr(),
                  value: _buildWorkingHoursText(jobDetails),
                ),

              // Salary Information
              if (jobDetails.minimum != null ||
                  jobDetails.maximum != null ||
                  jobDetails.fixedAt != null ||
                  jobDetails.amount != null)
                _buildSalaryInfo(jobDetails),
            ],
          ),
        ),
      ],
    );
  }

  String _buildWorkingHoursText(JobDetails jobDetails) {
    if (jobDetails.from == null || jobDetails.to == null) {
      return 'not_specified'.tr();
    }

    // Format time from decimal to time string
    String fromTime = _formatTimeFromDecimal(jobDetails.from!);
    String toTime = _formatTimeFromDecimal(jobDetails.to!);

    // Check if the times make sense (from should be before to in same day)
    // If "to" time appears to be next day (like 6 PM), handle it appropriately
    if (jobDetails.to! < jobDetails.from!) {
      // Assuming "to" time is in PM if it's smaller than "from"
      double adjustedTo = jobDetails.to! + 12.0;
      toTime = _formatTimeFromDecimal(adjustedTo);
    }

    return '$fromTime - $toTime';
  }

  String _formatTimeFromDecimal(double timeDecimal) {
    // Convert decimal to hours and minutes
    int hours = timeDecimal.floor();
    int minutes = ((timeDecimal - hours) * 60).round();

    // Handle 24-hour format edge cases
    if (hours >= 24) {
      hours = hours % 24;
    }

    // Determine AM/PM
    String period = hours >= 12 ? 'PM' : 'AM';

    // Convert to 12-hour format
    int displayHours = hours == 0 ? 12 : (hours > 12 ? hours - 12 : hours);

    // Format with leading zeros if needed
    String formattedMinutes = minutes.toString().padLeft(2, '0');

    return '$displayHours:$formattedMinutes $period';
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.green[700]),
          SizedBox(width: 8),
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.green[800],
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: Colors.black87, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSalaryInfo(JobDetails jobDetails) {
    String salaryText = '';
    if (jobDetails.minimum != null && jobDetails.maximum != null) {
      salaryText = '${jobDetails.minimum} - ${jobDetails.maximum}';
    } else if (jobDetails.fixedAt != null) {
      salaryText = '${jobDetails.fixedAt}';
    } else if (jobDetails.amount != null) {
      salaryText = '${jobDetails.amount}';
    }

    if (salaryText.isNotEmpty) {
      return _buildInfoRow(
        icon: Icons.attach_money,
        label: 'salary'.tr(),
        value: salaryText,
      );
    }

    return SizedBox.shrink();
  }

  
 
}
