import 'package:weather/feature/job_application/data/models/gender_model.dart';
import 'package:weather/feature/job_application/domain/repo/apply_application_repo.dart';

class GetGenderUseCase {
  final ApplyApplicationRepository repository;

  GetGenderUseCase(this.repository);

  Future<GenderModel> call() {
    return repository.getGenders();
  }
}
