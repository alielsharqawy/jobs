import 'package:weather/feature/job_application/data/models/job_details_model.dart';
import 'package:weather/feature/job_application/domain/repo/apply_application_repo.dart';

class GetJobDetailsUseCase {
  final ApplyApplicationRepository repository;

  GetJobDetailsUseCase(this.repository);

  Future<JobDetailsModel> call(String jobTitleAlias) {
    return repository.getJobDetails(jobTitleAlias);
  }
}
