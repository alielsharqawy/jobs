import 'package:weather/feature/home/domain/usecase/get_all_jobs_uc.dart';
import 'package:weather/feature/home/presentation/logic/get_all_jobs/get_all_jobs_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllJobsCubit extends Cubit<GetAllJobsState> {
  final GetAllJobsUC _getAllJobsUC;
  GetAllJobsCubit(this._getAllJobsUC) : super(GetAllJobsInitial());

  Future<void> getAllJobs() async {
    try {
      final jobs = await _getAllJobsUC.call();
      emit(GetAllJobsLoaded(jobs));
    } catch (e) {
      emit(GetAllJobsError(e.toString()));
    }
  }
}
