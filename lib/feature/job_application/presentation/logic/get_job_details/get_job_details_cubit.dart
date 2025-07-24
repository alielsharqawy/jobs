
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/feature/job_application/domain/usecase/get_job_details_uc.dart';
import 'package:weather/feature/job_application/presentation/logic/get_job_details/get_job_details_state.dart';

class GetJobDetailsCubit extends Cubit<GetJobDetailsState> {
  final GetJobDetailsUseCase getJobDetailsUseCase;

  GetJobDetailsCubit(this.getJobDetailsUseCase) : super(GetJobDetailsInitial());

  Future<void> fetchJobDetails(String jobTitleAlias) async {
    emit(GetJobDetailsLoading());
    try {
      final jobDetails = await getJobDetailsUseCase.call(jobTitleAlias);
      emit(GetJobDetailsLoaded(jobDetails));
    } catch (e) {
      emit(GetJobDetailsError(e.toString()));
    }
  }
}
