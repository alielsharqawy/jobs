import 'package:weather/feature/home/data/models/get_all_jobs_model.dart';
import 'package:weather/feature/home/data/models/logo_model.dart';

abstract class GetAllJobsRepo {
  Future<GetAllJobs> getAllJobs();
  Future<LogoModel> getLogo();
}
