import 'package:weather/feature/home/data/models/get_all_jobs_model.dart';

abstract class GetAllJobsState {}

class GetAllJobsInitial extends GetAllJobsState {}

class GetAllJobsLoading extends GetAllJobsState {}

class GetAllJobsLoaded extends GetAllJobsState {
  final GetAllJobs jobs;
  GetAllJobsLoaded(this.jobs);
}

class GetAllJobsError extends GetAllJobsState {
  final String message;
  GetAllJobsError(this.message);
}
