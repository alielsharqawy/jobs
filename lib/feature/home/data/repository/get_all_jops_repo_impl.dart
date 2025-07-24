import 'package:weather/feature/home/data/models/get_all_jobs_model.dart';
import 'package:weather/feature/home/data/models/logo_model.dart';
import 'package:weather/feature/home/data/remote/get_all_job_data_sourc.dart';
import 'package:weather/feature/home/domain/repository/get_all_jobs_repo.dart';

class GetAllJobsRepoImpl implements GetAllJobsRepo {
  final GetAllJobDataSourc _dataSource;

  GetAllJobsRepoImpl(this._dataSource);

  @override
  Future<GetAllJobs> getAllJobs() {
    return _dataSource.getAllJobs();
  }

  @override
  Future<LogoModel> getLogo() {
    return _dataSource.getLogo();
  }
}
