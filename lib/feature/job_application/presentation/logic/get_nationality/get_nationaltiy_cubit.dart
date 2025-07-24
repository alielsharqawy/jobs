import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/feature/job_application/domain/usecase/get_nationality_uc.dart';
import 'package:weather/feature/job_application/presentation/logic/get_nationality/get_nationaltiy_state.dart';

class GetNationalityCubit extends Cubit<GetNationalityState> {
  final GetNationalityUseCase _getNationalityUseCase;
  GetNationalityCubit(this._getNationalityUseCase) : super(GetNationalityInitial());

  Future<void> fetchNationalities() async {
    try {
      emit(GetNationalityLoading());
      
      final nationalityModel = await _getNationalityUseCase.call();
      
      // Extract nationality names from the model
      final List<String> nationalityNames = nationalityModel.result?.nationalities
          ?.map((nationality) => nationality.name ?? '')
          .where((name) => name.isNotEmpty)
          .toList() ?? [];
      
      emit(GetNationalityLoaded(nationalityNames));
    } catch (e) {
      emit(GetNationalityError('Failed to load nationalities: $e'));
    }
  }
}
