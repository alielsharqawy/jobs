import 'package:weather/feature/job_application/data/models/nationality_model.dart';
import 'package:weather/feature/job_application/domain/repo/apply_application_repo.dart';

class GetNationalityUseCase {
  final ApplyApplicationRepository repository;

  GetNationalityUseCase(this.repository);

  Future<NationalityModel> call() {
    return repository.getNationalities();
  }
}
