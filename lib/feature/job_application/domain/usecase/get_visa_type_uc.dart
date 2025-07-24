import 'package:weather/feature/job_application/data/models/visa_type_model.dart';
import 'package:weather/feature/job_application/domain/repo/apply_application_repo.dart';

class GetVisaTypeUseCase {
  final ApplyApplicationRepository repository;

  GetVisaTypeUseCase(this.repository);

  Future<VisaTypeModel> call() {
    return repository.getVisaTypes();
  }
}
