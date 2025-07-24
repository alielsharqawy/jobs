import 'package:weather/feature/job_application/data/models/job_details_model.dart';

abstract class GetJobDetailsState {}

final class GetJobDetailsInitial extends GetJobDetailsState {}

final class GetJobDetailsLoading extends GetJobDetailsState {}

final class GetJobDetailsLoaded extends GetJobDetailsState {
  final JobDetailsModel jobDetails;

  GetJobDetailsLoaded(this.jobDetails);
}

final class GetJobDetailsError extends GetJobDetailsState {
  final String message;

  GetJobDetailsError(this.message);
}
