import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather/core/widgets/custom_text_field.dart';

class WorkExperienceEntry {
  String companyName;
  String supervisorName;
  String startDate;
  String paySalary;
  String startingSalary;
  String finalSalary;
  String phoneNumber;
  String cityState;
  String jobTitle;
  String reasonForLeaving;
  String dutiesAndSkills;

  WorkExperienceEntry({
    required this.companyName,
    required this.supervisorName,
    required this.startDate,
    required this.paySalary,
    required this.startingSalary,
    required this.finalSalary,
    required this.phoneNumber,
    required this.cityState,
    required this.jobTitle,
    required this.reasonForLeaving,
    required this.dutiesAndSkills,
  });
}

class WorkExperienceStepForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const WorkExperienceStepForm({super.key, required this.formKey});

  @override
  State<WorkExperienceStepForm> createState() => _WorkExperienceStepFormState();
}

class _WorkExperienceStepFormState extends State<WorkExperienceStepForm> {
  final List<WorkExperienceEntry> _workExperienceEntries = [];

  // Controllers for current form
  final _companyNameController = TextEditingController();
  final _supervisorNameController = TextEditingController();
  final _startDateController = TextEditingController();
  final _paySalaryController = TextEditingController();
  final _startingSalaryController = TextEditingController();
  final _finalSalaryController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _cityStateController = TextEditingController();
  final _jobTitleController = TextEditingController();
  final _reasonForLeavingController = TextEditingController();
  final _dutiesAndSkillsController = TextEditingController();

  @override
  void dispose() {
    _companyNameController.dispose();
    _supervisorNameController.dispose();
    _startDateController.dispose();
    _paySalaryController.dispose();
    _startingSalaryController.dispose();
    _finalSalaryController.dispose();
    _phoneNumberController.dispose();
    _cityStateController.dispose();
    _jobTitleController.dispose();
    _reasonForLeavingController.dispose();
    _dutiesAndSkillsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          // Add Work Experience Form
          Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'add_work_experience'.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Name of the Last Company/Employer
                  CustomTextFormField(
                    labelText: 'company_name'.tr(),
                    hintText: 'company_name_hint'.tr(),
                    controller: _companyNameController,
                    prefixIcon: Icon(Icons.business_outlined),
                  ),
                  SizedBox(height: 16),

                  // Name of Last Supervisor
                  CustomTextFormField(
                    labelText: 'supervisor_name'.tr(),
                    hintText: 'supervisor_name_hint'.tr(),
                    controller: _supervisorNameController,
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  SizedBox(height: 16),

                  // Employment Start Date
                  GestureDetector(
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now().subtract(
                          Duration(days: 365),
                        ), // Default to 1 year ago
                        firstDate: DateTime(1980),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        final formattedDate = DateFormat(
                          'MM/dd/yyyy',
                        ).format(pickedDate);
                        _startDateController.text = formattedDate;
                      }
                    },
                    child: AbsorbPointer(
                      child: CustomTextFormField(
                        labelText: 'employment_start_date'.tr(),
                        hintText: "mm_dd_yyyy".tr(),
                        controller: _startDateController,
                        prefixIcon: Icon(Icons.calendar_today_outlined),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    labelText: 'pay_salary'.tr(),
                    hintText: 'pay_salary_hint'.tr(),
                    controller: _paySalaryController,
                    prefixIcon: Icon(Icons.attach_money_outlined),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    labelText: 'starting_salary'.tr(),
                    hintText: 'starting_salary_hint'.tr(),
                    controller: _startingSalaryController,
                    prefixIcon: Icon(Icons.trending_up_outlined),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    labelText: 'final_salary'.tr(),
                    hintText: 'final_salary_hint'.tr(),
                    controller: _finalSalaryController,
                    prefixIcon: Icon(Icons.money_outlined),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    prefixIcon: Icon(Icons.phone_outlined),
                    labelText: 'phone_number'.tr(),
                    hintText: 'phone_number_hint'.tr(),
                    controller: _phoneNumberController,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    labelText: 'city_state'.tr(),
                    hintText: 'city_state_hint'.tr(),
                    controller: _cityStateController,
                    prefixIcon: Icon(Icons.location_city_outlined),
                  ),

                  // Phone Number and City/State Row
                  SizedBox(height: 16),

                  // Last Job Title
                  CustomTextFormField(
                    labelText: 'last_job_title'.tr(),
                    hintText: 'last_job_title_hint'.tr(),
                    controller: _jobTitleController,
                    prefixIcon: Icon(Icons.work_outline),
                  ),
                  SizedBox(height: 16),

                  // Reason for Leaving
                  CustomTextFormFieldFactories.multiline(
                    labelText: 'reason_for_leaving'.tr(),
                    hintText: 'reason_for_leaving_hint'.tr(),
                    controller: _reasonForLeavingController,
                    maxLines: 3,
                  ),
                  SizedBox(height: 16),

                  // Duties Performed, Skills Used or Learned
                  CustomTextFormFieldFactories.multiline(
                    labelText: 'duties_and_skills'.tr(),
                    hintText: 'duties_and_skills_hint'.tr(),
                    controller: _dutiesAndSkillsController,
                    maxLines: 4,
                  ),
                  SizedBox(height: 16),

                  // Add Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _addWorkExperienceEntry,
                      icon: Icon(Icons.add),
                      label: Text('add_work_experience_btn'.tr()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16),

          // Work Experience Entries List
          if (_workExperienceEntries.isNotEmpty) ...[
            Text(
              'added_work_experience_entries'.tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8),

            // Work Experience List
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _workExperienceEntries.length,
              itemBuilder: (context, index) {
                final entry = _workExperienceEntries[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 8),
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      entry.companyName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${entry.jobTitle} - ${entry.startDate}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeWorkExperienceEntry(index),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoRow('Company:', entry.companyName),
                            _buildInfoRow('Supervisor:', entry.supervisorName),
                            _buildInfoRow('Job Title:', entry.jobTitle),
                            _buildInfoRow('Start Date:', entry.startDate),
                            _buildInfoRow('Pay Salary:', entry.paySalary),
                            _buildInfoRow(
                              'Starting Salary:',
                              entry.startingSalary,
                            ),
                            _buildInfoRow('Final Salary:', entry.finalSalary),
                            _buildInfoRow('Phone:', entry.phoneNumber),
                            _buildInfoRow('City/State:', entry.cityState),
                            _buildInfoRow(
                              'Reason for Leaving:',
                              entry.reasonForLeaving,
                            ),
                            _buildInfoRow(
                              'Duties & Skills:',
                              entry.dutiesAndSkills,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? 'Not specified' : value,
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }

  void _addWorkExperienceEntry() {
    if (_companyNameController.text.isEmpty ||
        _jobTitleController.text.isEmpty ||
        _startDateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('work_required_fields'.tr()),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _workExperienceEntries.add(
        WorkExperienceEntry(
          companyName: _companyNameController.text,
          supervisorName: _supervisorNameController.text,
          startDate: _startDateController.text,
          paySalary: _paySalaryController.text,
          startingSalary: _startingSalaryController.text,
          finalSalary: _finalSalaryController.text,
          phoneNumber: _phoneNumberController.text,
          cityState: _cityStateController.text,
          jobTitle: _jobTitleController.text,
          reasonForLeaving: _reasonForLeavingController.text,
          dutiesAndSkills: _dutiesAndSkillsController.text,
        ),
      );

      // Clear form fields
      _companyNameController.clear();
      _supervisorNameController.clear();
      _startDateController.clear();
      _paySalaryController.clear();
      _startingSalaryController.clear();
      _finalSalaryController.clear();
      _phoneNumberController.clear();
      _cityStateController.clear();
      _jobTitleController.clear();
      _reasonForLeavingController.clear();
      _dutiesAndSkillsController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('work_added_success'.tr()),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _removeWorkExperienceEntry(int index) {
    setState(() {
      _workExperienceEntries.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('work_removed'.tr()),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
