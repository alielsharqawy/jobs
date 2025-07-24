import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/feature/job_application/domain/usecase/get_institution_uc.dart';
import 'package:weather/feature/job_application/presentation/logic/get_institution/get_institution_state.dart';

class GetInstitutionCubit extends Cubit<GetInstitutionState> {
  final GetInstitutionTypeUseCase _getInstitutionTypeUseCase;
  GetInstitutionCubit(this._getInstitutionTypeUseCase) : super(GetInstitutionInitial());

  Future<void> fetchInstitutions() async {
    try {
      emit(GetInstitutionLoading());
      
      final institutionModel = await _getInstitutionTypeUseCase.call();
      
      // Extract institution type names from the model
      final List<String> institutionNames = institutionModel.result?.results
          ?.map((institution) => institution.text ?? '')
          .where((name) => name.isNotEmpty)
          .toList() ?? [];
      
      emit(GetInstitutionLoaded(institutionNames));
    } catch (e) {
      emit(GetInstitutionError('Failed to load institutions: $e'));
    }
  }
}
