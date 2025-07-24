import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/widgets/custom_text_field.dart';
import 'package:weather/feature/job_application/data/models/job_details_model.dart';
import 'package:weather/feature/job_application/presentation/logic/get_job_details/get_job_details_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_job_details/get_job_details_state.dart';

class QuestionsStepForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController question1Controller;
  final TextEditingController question2Controller;
  final TextEditingController question3Controller;

  const QuestionsStepForm({
    super.key,
    required this.formKey,
    required this.question1Controller,
    required this.question2Controller,
    required this.question3Controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetJobDetailsCubit, GetJobDetailsState>(
      builder: (context, state) {
        JobDetails? jobDetails;
        
        if (state is GetJobDetailsLoaded) {
          jobDetails = state.jobDetails.result;
        }
        
        return Form(
          key: formKey,
          child: Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Questions header
                  Text(
                    'questions'.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  // Dynamic Questions based on jobDetails
                  if (jobDetails != null) ...[
                    ...(_buildDynamicQuestions(jobDetails)),
                  ] else ...[
                    // Fallback to static questions if no jobDetails
                    ..._buildStaticQuestions(),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildDynamicQuestions(JobDetails jobDetails) {
    List<Widget> questionWidgets = [];
    
    // Question 1
    if (jobDetails.question1 != null && jobDetails.question1!.isNotEmpty) {
      questionWidgets.addAll([
        _buildQuestionItem(
          questionNumber: 1,
          questionText: jobDetails.question1!,
          controller: question1Controller,
        ),
        SizedBox(height: 24),
      ]);
    }
    
    // Question 2
    if (jobDetails.question2 != null && jobDetails.question2!.isNotEmpty) {
      questionWidgets.addAll([
        _buildQuestionItem(
          questionNumber: 2,
          questionText: jobDetails.question2!,
          controller: question2Controller,
        ),
        SizedBox(height: 24),
      ]);
    }
    
    // Question 3
    if (jobDetails.question3 != null && jobDetails.question3!.isNotEmpty) {
      questionWidgets.addAll([
        _buildQuestionItem(
          questionNumber: 3,
          questionText: jobDetails.question3!,
          controller: question3Controller,
        ),
      ]);
    }
    
    // If no questions available
    if (questionWidgets.isEmpty) {
      questionWidgets.add(
        Center(
          child: Text(
            'no_questions_available'.tr(),
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      );
    }
    
    return questionWidgets;
  }

  List<Widget> _buildStaticQuestions() {
    return [
      // Question 1
      _buildQuestionItem(
        questionNumber: 1,
        questionText: 'question_1_text'.tr(),
        controller: question1Controller,
      ),
      SizedBox(height: 24),
      
      // Question 2
      _buildQuestionItem(
        questionNumber: 2,
        questionText: 'question_2_text'.tr(),
        controller: question2Controller,
      ),
      SizedBox(height: 24),
      
      // Question 3
      _buildQuestionItem(
        questionNumber: 3,
        questionText: 'question_3_text'.tr(),
        controller: question3Controller,
      ),
    ];
  }

  Widget _buildQuestionItem({
    required int questionNumber,
    required String questionText,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Question number and title
        Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$questionNumber',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                '${'question'.tr()} $questionNumber:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        
        // Question text
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Text(
            questionText,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.4,
            ),
          ),
        ),
        SizedBox(height: 12),
        
        // Answer field
        CustomTextFormFieldFactories.multiline(
          labelText: 'your_answer'.tr(),
          hintText: 'enter_your_answer'.tr(),
          controller: controller,
          maxLines: 3,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return '${'question'.tr()} $questionNumber ${'is_required'.tr()}';
            }
            return null;
          },
        ),
      ],
    );
  }
}
