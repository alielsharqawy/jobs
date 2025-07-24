import 'package:weather/feature/job_application/data/models/institution_type_model.dart';
import 'package:weather/feature/job_application/domain/repo/apply_application_repo.dart';

class GetInstitutionTypeUseCase {
  final ApplyApplicationRepository repository;

  GetInstitutionTypeUseCase(this.repository);

  Future<InstitutionTypeModel> call() {
    return repository.getInstitutionTypes();
  }
}
