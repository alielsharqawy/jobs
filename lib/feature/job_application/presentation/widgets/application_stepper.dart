import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'personal_info_step_form.dart';
import 'education_step_form.dart';
import 'work_experience_step_form.dart';
import 'questions_step_form.dart';

class ApplicationStepper extends StatefulWidget {
  final String? jobTitleAlias;
  final String? jobTitle;

  const ApplicationStepper({super.key, this.jobTitleAlias, this.jobTitle});

  @override
  State<ApplicationStepper> createState() => _ApplicationStepperState();
}

class _ApplicationStepperState extends State<ApplicationStepper> {
  int currentStep = 0;

  // Form keys for each step
  final _personalFormKey = GlobalKey<FormState>();
  final _educationFormKey = GlobalKey<FormState>();
  final _workFormKey = GlobalKey<FormState>();
  final _questionsFormKey = GlobalKey<FormState>();

  // Personal Information Controllers
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _experienceYearsController = TextEditingController();
  final _noticePeriodController = TextEditingController();
  final _primaryNationalityController = TextEditingController();
  final _secondaryNationalityController = TextEditingController();
  final _genderController = TextEditingController();
  final _maritalStatusController = TextEditingController();
  final _visaTypeController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _positionAppliedController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _availableToJoinController = TextEditingController();
  final _expectedSalaryController = TextEditingController();

  // Questions Controllers
  final _question1Controller = TextEditingController();
  final _question2Controller = TextEditingController();
  final _question3Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.jobTitle != null) {
      _positionAppliedController.text = widget.jobTitle!;
    }
  }

  @override
  void dispose() {
    // Dispose Personal Controllers
    _nameController.dispose();
    _dateController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _experienceYearsController.dispose();
    _noticePeriodController.dispose();
    _primaryNationalityController.dispose();
    _secondaryNationalityController.dispose();
    _genderController.dispose();
    _maritalStatusController.dispose();
    _visaTypeController.dispose();
    _dateOfBirthController.dispose();
    _positionAppliedController.dispose();
    _telephoneController.dispose();
    _availableToJoinController.dispose();
    _expectedSalaryController.dispose();

    // Dispose Questions Controllers
    _question1Controller.dispose();
    _question2Controller.dispose();
    _question3Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: Theme.of(
          context,
        ).colorScheme.copyWith(primary: Colors.red),
      ),
      child: Stepper(
        physics: NeverScrollableScrollPhysics(),
        currentStep: currentStep,
        onStepTapped: (step) {
          setState(() {
            currentStep = step;
          });
        },
        controlsBuilder: (context, details) {
          return Row(
            children: [
              if (details.stepIndex < 3)
                Expanded(
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      details.stepIndex == 3 ? 'submit'.tr() : 'next'.tr(),
                    ),
                  ),
                ),
              if (details.stepIndex == 3)
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _submitApplication(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text('submit_application'.tr()),
                  ),
                ),
              SizedBox(width: 12),
              if (details.stepIndex > 0)
                Expanded(
                  child: OutlinedButton(
                    onPressed: details.onStepCancel,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text('previous'.tr()),
                  ),
                ),
            ],
          );
        },
        onStepContinue: () {
          if (_validateCurrentStep()) {
            if (currentStep < 3) {
              setState(() {
                currentStep++;
              });
            }
          }
        },
        onStepCancel: () {
          if (currentStep > 0) {
            setState(() {
              currentStep--;
            });
          }
        },
        steps: [
          // Step 1: Personal Information
          Step(
            title: Text('personal_info'.tr()),
            content: PersonalInfoStepForm(
              formKey: _personalFormKey,
              nameController: _nameController,
              dateController: _dateController,
              addressController: _addressController,
              emailController: _emailController,
              experienceYearsController: _experienceYearsController,
              noticePeriodController: _noticePeriodController,
              primaryNationalityController: _primaryNationalityController,
              secondaryNationalityController: _secondaryNationalityController,
              genderController: _genderController,
              maritalStatusController: _maritalStatusController,
              visaTypeController: _visaTypeController,
              dateOfBirthController: _dateOfBirthController,
              positionAppliedController: _positionAppliedController,
              telephoneController: _telephoneController,
              availableToJoinController: _availableToJoinController,
              expectedSalaryController: _expectedSalaryController,
            ),
            isActive: currentStep >= 0,
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
          ),

          // Step 2: Education
          Step(
            title: Text('education'.tr()),
            content: EducationStepForm(formKey: _educationFormKey),
            isActive: currentStep >= 1,
            state: currentStep > 1
                ? StepState.complete
                : currentStep == 1
                ? StepState.indexed
                : StepState.disabled,
          ),

          // Step 3: Work Experience
          Step(
            title: Text('work_experience'.tr()),
            content: WorkExperienceStepForm(formKey: _workFormKey),
            isActive: currentStep >= 2,
            state: currentStep > 2
                ? StepState.complete
                : currentStep == 2
                ? StepState.indexed
                : StepState.disabled,
          ),

          // Step 4: Questions
          Step(
            title: Text('questions'.tr()),
            content: QuestionsStepForm(
              formKey: _questionsFormKey,
              question1Controller: _question1Controller,
              question2Controller: _question2Controller,
              question3Controller: _question3Controller,
            ),
            isActive: currentStep >= 3,
            state: currentStep == 3 ? StepState.indexed : StepState.disabled,
          ),
        ],
      ),
    );
  }

  bool _validateCurrentStep() {
    switch (currentStep) {
      case 0:
        return _personalFormKey.currentState?.validate() ?? false;
      case 1:
        return _educationFormKey.currentState?.validate() ?? false;
      case 2:
        return _workFormKey.currentState?.validate() ?? false;
      case 3:
        return _questionsFormKey.currentState?.validate() ?? false;
      default:
        return false;
    }
  }

  void _submitApplication() {
    if (_questionsFormKey.currentState?.validate() ?? false) {
      _showSubmissionDialog();
    }
  }

  void _showSubmissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('application_summary'.tr()),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'personal_information_colon'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${'name_colon'.tr()} ${_nameController.text}'),
              Text('${'email_colon'.tr()} ${_emailController.text}'),
              Text('${'telephone_colon'.tr()} ${_telephoneController.text}'),
              Text(
                '${'position_colon'.tr()} ${_positionAppliedController.text}',
              ),
              SizedBox(height: 16),
              Text('ready_to_submit'.tr()),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('review'.tr(), style: TextStyle(color: Colors.black)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('application_success'.tr()),
                  backgroundColor: Colors.green,
                ),
              );
              // Navigate back or reset form
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: Text('submit'.tr(), style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
