import 'package:weather/feature/job_application/data/models/country_model.dart';
import 'package:weather/feature/job_application/data/models/gender_model.dart';
import 'package:weather/feature/job_application/data/models/institution_type_model.dart';
import 'package:weather/feature/job_application/data/models/job_details_model.dart';
import 'package:weather/feature/job_application/data/models/marital_status_model.dart';
import 'package:weather/feature/job_application/data/models/nationality_model.dart';
import 'package:weather/feature/job_application/data/models/visa_type_model.dart';

abstract class ApplyApplicationRepository {
  Future<JobDetailsModel> getJobDetails(String jobTitleAlias);
  Future<CountryModel> getCountries();
  Future<NationalityModel> getNationalities();
  Future<GenderModel> getGenders();
  Future<MaritalStatusModel> getMaritalStatuses();
  Future<InstitutionTypeModel> getInstitutionTypes();
  Future<VisaTypeModel> getVisaTypes();
}
