import 'package:weather/feature/home/data/models/get_all_jobs_model.dart';
import 'package:weather/feature/home/domain/repository/get_all_jobs_repo.dart';

class GetAllJobsUC {
  final GetAllJobsRepo _repo;

  GetAllJobsUC(this._repo);

  Future<GetAllJobs> call() {
    return _repo.getAllJobs();
  }
}
