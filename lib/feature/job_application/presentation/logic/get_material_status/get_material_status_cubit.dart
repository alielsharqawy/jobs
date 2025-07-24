import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/feature/job_application/domain/usecase/get_material_status_uc.dart';
import 'package:weather/feature/job_application/presentation/logic/get_material_status/get_material_status_state.dart';

class GetMaterialStatusCubit extends Cubit<GetMaterialStatusState> {
  final GetMaritalStatusUseCase _getMaterialStatusUseCase;
  GetMaterialStatusCubit(this._getMaterialStatusUseCase) : super(GetMaterialStatusInitial());

  Future<void> fetchMaterialStatuses() async {
    try {
      emit(GetMaterialStatusLoading());
      
      final maritalStatusModel = await _getMaterialStatusUseCase.call();
      
      // Extract marital status names from the model
      final List<String> statusNames = maritalStatusModel.result?.statuses
          ?.map((status) => status.name ?? '')
          .where((name) => name.isNotEmpty)
          .toList() ?? [];
      
      emit(GetMaterialStatusLoaded(statusNames));
    } catch (e) {
      emit(GetMaterialStatusError('Failed to load material statuses: $e'));
    }
  }
}
