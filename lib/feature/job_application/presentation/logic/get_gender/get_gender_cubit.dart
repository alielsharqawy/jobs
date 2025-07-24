import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/feature/job_application/domain/usecase/get_gender_uc.dart';
import 'package:weather/feature/job_application/presentation/logic/get_gender/get_gender_state.dart';

class GetGenderCubit extends Cubit<GetGenderState> {
  final GetGenderUseCase _getGenderUseCase;
  GetGenderCubit(this._getGenderUseCase) : super(GetGenderInitial());

  Future<void> fetchGenders() async {
    try {
      emit(GetGenderLoading());
      
      final genderModel = await _getGenderUseCase.call();
      
      // Extract gender names from the model
      final List<String> genderNames = genderModel.result?.genders
          ?.map((gender) => gender.name ?? '')
          .where((name) => name.isNotEmpty)
          .toList() ?? [];
      
      emit(GetGenderLoaded(genderNames));
    } catch (e) {
      emit(GetGenderError('Failed to load genders: $e'));
    }
  }
}
