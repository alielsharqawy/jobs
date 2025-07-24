import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/feature/job_application/data/models/country_model.dart';
import 'package:weather/feature/job_application/data/models/gender_model.dart';
import 'package:weather/feature/job_application/data/models/institution_type_model.dart';
import 'package:weather/feature/job_application/data/models/job_details_model.dart';
import 'package:weather/feature/job_application/data/models/marital_status_model.dart';
import 'package:weather/feature/job_application/data/models/nationality_model.dart';
import 'package:weather/feature/job_application/data/models/visa_type_model.dart';

abstract class ApplyApplicationDataSource {
  Future<JobDetailsModel> getJobDetails(String jobTitleAlias);
  Future<CountryModel> getCountries();
  Future<NationalityModel> getNationalities();
  Future<GenderModel> getGenders();
  Future<MaritalStatusModel> getMaritalStatuses();
  Future<InstitutionTypeModel> getInstitutionTypes();
  Future<VisaTypeModel> getVisaTypes();
}

class ApplyApplicationDataSourceImpl implements ApplyApplicationDataSource {
  @override
  Future<CountryModel> getCountries() {
    final url =
        "https://api.tenxerp.com/api/api/services/app/FndLookupValues/GetFndLookupValuesSelect2?type=Country&&pageSize=500&pageNumber=1";
    return http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return CountryModel.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load countries');
      }
    });
  }

  @override
  Future<GenderModel> getGenders() {
    final url =
        "https://api.tenxerp.com/api/api/services/app/FndLookupValues/GetFndLookupValuesSelect2?type=Gender&&pageSize=500&pageNumber=1";
    return http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return GenderModel.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load genders');
      }
    });
  }

  @override
  Future<InstitutionTypeModel> getInstitutionTypes() async {
    final url =
        "https://api.tenxerp.com/api/api/services/app/FndLookupValues/GetFndLookupValuesSelect2?type=CandidatesInstitution&&pageSize=500&pageNumber=1";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return InstitutionTypeModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load institution types');
    }
  }

  @override
  Future<MaritalStatusModel> getMaritalStatuses() {
    final url =
        "https://api.tenxerp.com/api/api/services/app/FndLookupValues/GetFndLookupValuesSelect2?type=MaritalStatus&&pageSize=500&pageNumber=1";
    return http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return MaritalStatusModel.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load marital statuses');
      }
    });
  }

  @override
  Future<NationalityModel> getNationalities() {
    final url =
        "https://api.tenxerp.com/api/api/services/app/FndLookupValues/GetFndLookupValuesSelect2?type=Nationality&&pageSize=500&pageNumber=1";
    return http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return NationalityModel.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load nationalities');
      }
    });
  }

  @override
  Future<VisaTypeModel> getVisaTypes() {
    final url =
        "https://api.tenxerp.com/api/api/services/app/FndLookupValues/GetFndLookupValuesSelect2?type=HrPersonVisaDetailsVisaType&&pageSize=500&pageNumber=1";
    return http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return VisaTypeModel.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load visa types');
      }
    });
  }
  
  @override
  Future<JobDetailsModel> getJobDetails(String jobTitleAlias) {
    final url =
        "https://api.tenxerp.com/api/api/services/app/Vacancies/GetAllByJobTitleAlias?JobTitleAlias=$jobTitleAlias";
    return http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return JobDetailsModel.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load job details');
      }
    });
  }
}
