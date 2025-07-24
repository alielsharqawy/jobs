import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/widgets/custom_text_field.dart';
import 'package:weather/feature/job_application/presentation/logic/get_nationality/get_nationaltiy_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_nationality/get_nationaltiy_state.dart';
import 'package:weather/feature/job_application/presentation/logic/get_gender/get_gender_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_gender/get_gender_state.dart';
import 'package:weather/feature/job_application/presentation/logic/get_material_status/get_material_status_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_material_status/get_material_status_state.dart';
import 'package:weather/feature/job_application/presentation/logic/get_visa_type/get_visa_type_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_visa_type/get_visa_type_state.dart';

class PersonalInfoStepForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController dateController;
  final TextEditingController addressController;
  final TextEditingController emailController;
  final TextEditingController experienceYearsController;
  final TextEditingController noticePeriodController;
  final TextEditingController primaryNationalityController;
  final TextEditingController secondaryNationalityController;
  final TextEditingController genderController;
  final TextEditingController maritalStatusController;
  final TextEditingController visaTypeController;
  final TextEditingController dateOfBirthController;
  final TextEditingController positionAppliedController;
  final TextEditingController telephoneController;
  final TextEditingController availableToJoinController;
  final TextEditingController expectedSalaryController;

  const PersonalInfoStepForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.dateController,
    required this.addressController,
    required this.emailController,
    required this.experienceYearsController,
    required this.noticePeriodController,
    required this.primaryNationalityController,
    required this.secondaryNationalityController,
    required this.genderController,
    required this.maritalStatusController,
    required this.visaTypeController,
    required this.dateOfBirthController,
    required this.positionAppliedController,
    required this.telephoneController,
    required this.availableToJoinController,
    required this.expectedSalaryController,
  });

  @override
  State<PersonalInfoStepForm> createState() => _PersonalInfoStepFormState();
}

class _PersonalInfoStepFormState extends State<PersonalInfoStepForm> {
  String? _selectedPrimaryNationality;
  String? _selectedSecondaryNationality;
  String? _selectedGender;
  String? _selectedMaritalStatus;
  String? _selectedVisaType;

  @override
  void initState() {
    super.initState();
    // Fetch data when widget initializes
    context.read<GetNationalityCubit>().fetchNationalities();
    context.read<GetGenderCubit>().fetchGenders();
    context.read<GetMaterialStatusCubit>().fetchMaterialStatuses();
    context.read<GetVisaTypeCubit>().fetchVisaTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          // Name
          CustomTextFormFieldFactories.name(
            labelText: 'name'.tr(),
            hintText: 'enter_name'.tr(),
            controller: widget.nameController,
          ),
          SizedBox(height: 16),

          // Date
          GestureDetector(
            onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                final formattedDate = DateFormat('MM/dd/yyyy').format(pickedDate);
                widget.dateController.text = formattedDate;
              }
            },
            child: AbsorbPointer(
              child: CustomTextFormField(
                labelText: 'date'.tr(),
                hintText: "mm_dd_yyyy".tr(),
                controller: widget.dateController,
                prefixIcon: Icon(Icons.calendar_today_outlined),
                keyboardType: TextInputType.datetime,
              ),
            ),
          ),
          SizedBox(height: 16),

          // Address
          CustomTextFormField(
            labelText: 'address'.tr(),
            hintText: 'address_hint'.tr(),
            controller: widget.addressController,
            prefixIcon: Icon(Icons.location_on_outlined),
          ),
          SizedBox(height: 16),

          // Email
          CustomTextFormFieldFactories.email(
            labelText: 'email'.tr(),
            hintText: 'enter_email'.tr(),
            controller: widget.emailController,
          ),
          SizedBox(height: 16),

          // Years Of Experience
          CustomTextFormField(
            labelText: 'years_of_experience'.tr(),
            hintText: 'years_of_experience_hint'.tr(),
            controller: widget.experienceYearsController,
            keyboardType: TextInputType.number,
            prefixIcon: Icon(Icons.work_history_outlined),
          ),
          SizedBox(height: 16),

          // Notice Period
          CustomTextFormField(
            labelText: 'notice_period'.tr(),
            hintText: 'notice_period_hint'.tr(),
            controller: widget.noticePeriodController,
            prefixIcon: Icon(Icons.schedule_outlined),
          ),
          SizedBox(height: 16),
          // Primary Nationality
          BlocBuilder<GetNationalityCubit, GetNationalityState>(
            builder: (context, state) {
              if (state is GetNationalityLoaded) {
                return DropdownButtonFormField<String>(
                  value: _selectedPrimaryNationality,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: 'primary_nationality'.tr(),
                    hintText: 'primary_nationality_hint'.tr(),
                    prefixIcon: Icon(Icons.flag_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                  items: state.nationalities.map((nationality) {
                    return DropdownMenuItem(
                      value: nationality,
                      child: Text(nationality, overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedPrimaryNationality = value;
                      widget.primaryNationalityController.text = value ?? '';
                    });
                  },
                );
              } else if (state is GetNationalityLoading) {
                return CustomTextFormField(
                  labelText: 'primary_nationality'.tr(),
                  hintText: 'Loading...',
                  controller: widget.primaryNationalityController,
                  prefixIcon: Icon(Icons.flag_outlined),
                  enabled: false,
                );
              } else {
                return CustomTextFormField(
                  labelText: 'primary_nationality'.tr(),
                  hintText: 'primary_nationality_hint'.tr(),
                  controller: widget.primaryNationalityController,
                  prefixIcon: Icon(Icons.flag_outlined),
                );
              }
            },
          ),
          SizedBox(height: 16),

          // Secondary Nationality
          BlocBuilder<GetNationalityCubit, GetNationalityState>(
            builder: (context, state) {
              if (state is GetNationalityLoaded) {
                return DropdownButtonFormField<String>(
                  value: _selectedSecondaryNationality,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: 'secondary_nationality'.tr(),
                    hintText: 'secondary_nationality_hint'.tr(),
                    prefixIcon: Icon(Icons.outlined_flag_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(value: null, child: Text('None')),
                    ...state.nationalities.map((nationality) {
                      return DropdownMenuItem(
                        value: nationality,
                        child: Text(nationality, overflow: TextOverflow.ellipsis),
                      );
                    }).toList(),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedSecondaryNationality = value;
                      widget.secondaryNationalityController.text = value ?? '';
                    });
                  },
                );
              } else if (state is GetNationalityLoading) {
                return CustomTextFormField(
                  labelText: 'secondary_nationality'.tr(),
                  hintText: 'Loading...',
                  controller: widget.secondaryNationalityController,
                  prefixIcon: Icon(Icons.outlined_flag_outlined),
                  enabled: false,
                );
              } else {
                return CustomTextFormField(
                  labelText: 'secondary_nationality'.tr(),
                  hintText: 'secondary_nationality_hint'.tr(),
                  controller: widget.secondaryNationalityController,
                  prefixIcon: Icon(Icons.outlined_flag_outlined),
                );
              }
            },
          ),
          SizedBox(height: 16),
          // Gender
          BlocBuilder<GetGenderCubit, GetGenderState>(
            builder: (context, state) {
              if (state is GetGenderLoaded) {
                return DropdownButtonFormField<String>(
                  value: _selectedGender,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: 'gender'.tr(),
                    hintText: 'gender_hint'.tr(),
                    prefixIcon: Icon(Icons.person_2_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                  items: state.genders.map((gender) {
                    return DropdownMenuItem(
                      value: gender,
                      child: Text(gender, overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                      widget.genderController.text = value ?? '';
                    });
                  },
                );
              } else if (state is GetGenderLoading) {
                return CustomTextFormField(
                  labelText: 'gender'.tr(),
                  hintText: 'Loading...',
                  controller: widget.genderController,
                  prefixIcon: Icon(Icons.person_2_outlined),
                  enabled: false,
                );
              } else {
                return CustomTextFormField(
                  labelText: 'gender'.tr(),
                  hintText: 'gender_hint'.tr(),
                  controller: widget.genderController,
                  prefixIcon: Icon(Icons.person_2_outlined),
                );
              }
            },
          ),
          SizedBox(height: 16),

          // Marital Status
          BlocBuilder<GetMaterialStatusCubit, GetMaterialStatusState>(
            builder: (context, state) {
              if (state is GetMaterialStatusLoaded) {
                return DropdownButtonFormField<String>(
                  value: _selectedMaritalStatus,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: 'marital_status'.tr(),
                    hintText: 'marital_status_hint'.tr(),
                    prefixIcon: Icon(Icons.family_restroom_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                  items: state.statuses.map((status) {
                    return DropdownMenuItem(
                      value: status,
                      child: Text(status, overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedMaritalStatus = value;
                      widget.maritalStatusController.text = value ?? '';
                    });
                  },
                );
              } else if (state is GetMaterialStatusLoading) {
                return CustomTextFormField(
                  labelText: 'marital_status'.tr(),
                  hintText: 'Loading...',
                  controller: widget.maritalStatusController,
                  prefixIcon: Icon(Icons.family_restroom_outlined),
                  enabled: false,
                );
              } else {
                return CustomTextFormField(
                  labelText: 'marital_status'.tr(),
                  hintText: 'marital_status_hint'.tr(),
                  controller: widget.maritalStatusController,
                  prefixIcon: Icon(Icons.family_restroom_outlined),
                );
              }
            },
          ),
          SizedBox(height: 16),

          // Visa Type
          BlocBuilder<GetVisaTypeCubit, GetVisaTypeState>(
            builder: (context, state) {
              if (state is GetVisaTypeLoaded) {
                return DropdownButtonFormField<String>(
                  value: _selectedVisaType,
                  isExpanded: true,
                  decoration: InputDecoration(
                    labelText: 'type_of_visa'.tr(),
                    hintText: 'type_of_visa_hint'.tr(),
                    prefixIcon: Icon(Icons.card_membership_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                  items: state.visaType.map((visa) {
                    return DropdownMenuItem(
                      value: visa,
                      child: Text(visa, overflow: TextOverflow.ellipsis),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedVisaType = value;
                      widget.visaTypeController.text = value ?? '';
                    });
                  },
                );
              } else if (state is GetVisaTypeLoading) {
                return CustomTextFormField(
                  labelText: 'type_of_visa'.tr(),
                  hintText: 'Loading...',
                  controller: widget.visaTypeController,
                  prefixIcon: Icon(Icons.card_membership_outlined),
                  enabled: false,
                );
              } else {
                return CustomTextFormField(
                  labelText: 'type_of_visa'.tr(),
                  hintText: 'type_of_visa_hint'.tr(),
                  controller: widget.visaTypeController,
                  prefixIcon: Icon(Icons.card_membership_outlined),
                );
              }
            },
          ),
          SizedBox(height: 16),

          // Date of Birth
          GestureDetector(
            onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now().subtract(Duration(days: 365 * 18)), // Default to 18 years ago
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                final formattedDate = DateFormat('MM/dd/yyyy').format(pickedDate);
                widget.dateOfBirthController.text = formattedDate;
              }
            },
            child: AbsorbPointer(
              child: CustomTextFormField(
                labelText: 'date_of_birth'.tr(),
                hintText: "mm_dd_yyyy".tr(),
                controller: widget.dateOfBirthController,
                prefixIcon: Icon(Icons.cake_outlined),
                keyboardType: TextInputType.datetime,
              ),
            ),
          ),
          SizedBox(height: 16),

          // Position Applied For
          CustomTextFormField(
            labelText: 'position_applied_for'.tr(),
            hintText: 'position_applied_for_hint'.tr(),
            controller: widget.positionAppliedController,
            prefixIcon: Icon(Icons.work_outline),
          ),
          SizedBox(height: 16),

          // Telephone
          CustomTextFormFieldFactories.phone(
            labelText: 'telephone'.tr(),
            hintText: 'telephone_hint'.tr(),
            controller: widget.telephoneController,
          ),
          SizedBox(height: 16),

          // Available to Join
          GestureDetector(
            onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now().add(Duration(days: 30)), // Default to 30 days from now
                firstDate: DateTime.now(),
                lastDate: DateTime(2030),
              );
              if (pickedDate != null) {
                final formattedDate = DateFormat('MM/dd/yyyy').format(pickedDate);
                widget.availableToJoinController.text = formattedDate;
              }
            },
            child: AbsorbPointer(
              child: CustomTextFormField(
                labelText: 'available_to_join'.tr(),
                hintText: "mm_dd_yyyy".tr(),
                controller: widget.availableToJoinController,
                prefixIcon: Icon(Icons.date_range_outlined),
                keyboardType: TextInputType.datetime,
              ),
            ),
          ),
          SizedBox(height: 16),

          // Expected Salary
          CustomTextFormField(
            labelText: 'expected_salary'.tr(),
            hintText: 'expected_salary_hint'.tr(),
            controller: widget.expectedSalaryController,
            keyboardType: TextInputType.number,
            prefixIcon: Icon(Icons.attach_money_outlined),
          ),
          SizedBox(height: 16),

          // Upload CV Section
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade400,
                style: BorderStyle.solid,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {
                // TODO: Implement file picker
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('File picker will be implemented')),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: 40,
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'upload_cv'.tr(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'upload_cv_hint'.tr(),
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
