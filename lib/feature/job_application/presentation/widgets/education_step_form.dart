import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/widgets/custom_text_field.dart';
import 'package:weather/feature/job_application/presentation/logic/get_institution/get_institution_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_institution/get_institution_state.dart';
import 'package:weather/feature/job_application/presentation/logic/get_country/get_country_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_country/get_country_state.dart';

class EducationEntry {
  String institutionType;
  String institutionName;
  String majorDegree;
  String country;
  String city;

  EducationEntry({
    required this.institutionType,
    required this.institutionName,
    required this.majorDegree,
    required this.country,
    required this.city,
  });
}

class EducationStepForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const EducationStepForm({super.key, required this.formKey});

  @override
  State<EducationStepForm> createState() => _EducationStepFormState();
}

class _EducationStepFormState extends State<EducationStepForm> {
  final List<EducationEntry> _educationEntries = [];
  String? _selectedInstitutionType;
  String? _selectedCountry;

  // Controllers for current form
  final _institutionTypeController = TextEditingController();
  final _institutionNameController = TextEditingController();
  final _majorDegreeController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch institution types and countries when form initializes
    context.read<GetInstitutionCubit>().fetchInstitutions();
    context.read<GetCountryCubit>().fetchCountries();
  }

  @override
  void dispose() {
    _institutionTypeController.dispose();
    _institutionNameController.dispose();
    _majorDegreeController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          // Add Education Form
          Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'add_education'.tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Type of Institution
                  BlocBuilder<GetInstitutionCubit, GetInstitutionState>(
                    builder: (context, state) {
                      if (state is GetInstitutionLoading) {
                        return DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'type_of_institution'.tr(),
                            hintText: 'loading'.tr(),
                            prefixIcon: Icon(Icons.school_outlined),
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
                          items: [],
                          onChanged: null,
                        );
                      }
                      
                      if (state is GetInstitutionError) {
                        return DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'type_of_institution'.tr(),
                            hintText: 'error_loading_data'.tr(),
                            prefixIcon: Icon(Icons.error_outline, color: Colors.red),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red, width: 2),
                            ),
                          ),
                          items: [],
                          onChanged: null,
                        );
                      }
                      
                      if (state is GetInstitutionLoaded) {
                        return DropdownButtonFormField<String>(
                          value: _selectedInstitutionType,
                          isExpanded: true,
                          decoration: InputDecoration(
                            labelText: 'type_of_institution'.tr(),
                            hintText: 'type_of_institution_hint'.tr(),
                            prefixIcon: Icon(Icons.school_outlined),
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
                          items: state.institutions.map((institution) {
                            return DropdownMenuItem<String>(
                              value: institution,
                              child: Text(
                                institution,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedInstitutionType = value;
                              _institutionTypeController.text = value ?? '';
                            });
                          },
                        );
                      }
                      
                      return Container(); // Default fallback
                    },
                  ),
                  SizedBox(height: 16),

                  // Name of Institution
                  CustomTextFormField(
                    labelText: 'name_of_institution'.tr(),
                    hintText: 'name_of_institution_hint'.tr(),
                    controller: _institutionNameController,
                    prefixIcon: Icon(Icons.account_balance_outlined),
                  ),
                  SizedBox(height: 16),

                  // Major/Degree
                  CustomTextFormField(
                    labelText: 'major_degree'.tr(),
                    hintText: 'major_degree_hint'.tr(),
                    controller: _majorDegreeController,
                    prefixIcon: Icon(Icons.book_outlined),
                  ),
                  SizedBox(height: 16),

                  // Country
                  BlocBuilder<GetCountryCubit, GetCountryState>(
                    builder: (context, state) {
                      if (state is GetCountryLoading) {
                        return DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'country'.tr(),
                            hintText: 'loading'.tr(),
                            prefixIcon: Icon(Icons.public_outlined),
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
                          items: [],
                          onChanged: null,
                        );
                      }
                      
                      if (state is GetCountryError) {
                        return DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'country'.tr(),
                            hintText: 'error_loading_data'.tr(),
                            prefixIcon: Icon(Icons.error_outline, color: Colors.red),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red, width: 2),
                            ),
                          ),
                          items: [],
                          onChanged: null,
                        );
                      }
                      
                      if (state is GetCountryLoaded) {
                        return DropdownButtonFormField<String>(
                          value: _selectedCountry,
                          isExpanded: true,
                          decoration: InputDecoration(
                            labelText: 'country'.tr(),
                            hintText: 'country_hint'.tr(),
                            prefixIcon: Icon(Icons.public_outlined),
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
                          items: state.countries.map((country) {
                            return DropdownMenuItem<String>(
                              value: country,
                              child: Text(
                                country,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCountry = value;
                              _countryController.text = value ?? '';
                            });
                          },
                        );
                      }
                      
                      return Container(); // Default fallback
                    },
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    labelText: 'city'.tr(),
                    hintText: 'city_hint'.tr(),
                    controller: _cityController,
                    prefixIcon: Icon(Icons.location_city_outlined),
                  ),

                  // Country and City Row
                  SizedBox(height: 16),

                  // Add Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _addEducationEntry,
                      icon: Icon(Icons.add),
                      label: Text('add_education_btn'.tr()),
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

          // Education Entries List
          if (_educationEntries.isNotEmpty) ...[
            Text(
              'added_education_entries'.tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8),

            // Education List
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _educationEntries.length,
              itemBuilder: (context, index) {
                final entry = _educationEntries[index];
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
                      entry.institutionName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${entry.majorDegree} - ${entry.institutionType}',
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeEducationEntry(index),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoRow('Type:', _getTranslatedText(entry.institutionType)),
                            _buildInfoRow(
                              'Institution:',
                              entry.institutionName,
                            ),
                            _buildInfoRow('Major/Degree:', entry.majorDegree),
                            _buildInfoRow('Country:', _getTranslatedText(entry.country)),
                            _buildInfoRow('City:', entry.city),
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
            width: 100,
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

  String _getTranslatedText(String key) {
    // Try to get translation, if not found return the original key
    try {
      return key.tr();
    } catch (e) {
      return key;
    }
  }

  void _addEducationEntry() {
    if (_institutionTypeController.text.isEmpty ||
        _institutionNameController.text.isEmpty ||
        _majorDegreeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('education_required_fields'.tr()),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _educationEntries.add(
        EducationEntry(
          institutionType: _institutionTypeController.text,
          institutionName: _institutionNameController.text,
          majorDegree: _majorDegreeController.text,
          country: _countryController.text,
          city: _cityController.text,
        ),
      );

      // Clear form fields
      _institutionTypeController.clear();
      _institutionNameController.clear();
      _majorDegreeController.clear();
      _countryController.clear();
      _cityController.clear();
      _selectedInstitutionType = null;
      _selectedCountry = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('education_added_success'.tr()),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _removeEducationEntry(int index) {
    setState(() {
      _educationEntries.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('education_removed'.tr()),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
