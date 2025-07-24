import 'package:weather/feature/job_application/data/models/marital_status_model.dart';
import 'package:weather/feature/job_application/domain/repo/apply_application_repo.dart';

class GetMaritalStatusUseCase {
  final ApplyApplicationRepository repository;

  GetMaritalStatusUseCase(this.repository);

  Future<MaritalStatusModel> call() {
    return repository.getMaritalStatuses();
  }
}
