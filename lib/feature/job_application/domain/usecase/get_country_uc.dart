import 'package:weather/feature/job_application/data/models/country_model.dart';
import 'package:weather/feature/job_application/domain/repo/apply_application_repo.dart';

class GetCountryUseCase {
  final ApplyApplicationRepository repository;

  GetCountryUseCase(this.repository);

  Future<CountryModel> call() {
    return repository.getCountries();
  }
}
