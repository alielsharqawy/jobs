import 'package:weather/feature/home/data/models/logo_model.dart';
import 'package:weather/feature/home/domain/repository/get_all_jobs_repo.dart';

class GetLogoUC {
  final GetAllJobsRepo _repo;

  GetLogoUC(this._repo);

  Future<LogoModel> call() {
    return _repo.getLogo();
  }
}
