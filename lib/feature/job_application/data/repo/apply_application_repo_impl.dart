import 'package:weather/feature/job_application/data/models/country_model.dart';
import 'package:weather/feature/job_application/data/models/gender_model.dart';
import 'package:weather/feature/job_application/data/models/institution_type_model.dart';
import 'package:weather/feature/job_application/data/models/job_details_model.dart';
import 'package:weather/feature/job_application/data/models/marital_status_model.dart';
import 'package:weather/feature/job_application/data/models/nationality_model.dart';
import 'package:weather/feature/job_application/data/models/visa_type_model.dart';
import 'package:weather/feature/job_application/data/remote/apply_application_data_source.dart';
import 'package:weather/feature/job_application/domain/repo/apply_application_repo.dart';

class ApplyApplicationRepositoryImpl implements ApplyApplicationRepository {
  final ApplyApplicationDataSource dataSource;

  ApplyApplicationRepositoryImpl(this.dataSource);

  @override
  Future<CountryModel> getCountries() {
    return dataSource.getCountries();
  }

  @override
  Future<NationalityModel> getNationalities() {
    return dataSource.getNationalities();
  }

  @override
  Future<GenderModel> getGenders() {
    return dataSource.getGenders();
  }

  @override
  Future<MaritalStatusModel> getMaritalStatuses() {
    return dataSource.getMaritalStatuses();
  }

  @override
  Future<InstitutionTypeModel> getInstitutionTypes() {
    return dataSource.getInstitutionTypes();
  }

  @override
  Future<VisaTypeModel> getVisaTypes() {
    return dataSource.getVisaTypes();
  }

  @override
  Future<JobDetailsModel> getJobDetails(String jobTitleAlias) {
    return dataSource.getJobDetails(jobTitleAlias);
  }
}
