import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/feature/job_application/domain/usecase/get_visa_type_uc.dart';
import 'package:weather/feature/job_application/presentation/logic/get_visa_type/get_visa_type_state.dart';

class GetVisaTypeCubit extends Cubit<GetVisaTypeState> {
  final GetVisaTypeUseCase getVisaTypeUseCase;

  GetVisaTypeCubit(this.getVisaTypeUseCase) : super(GetVisaTypeInitial());

  Future<void> fetchVisaTypes() async {
    emit(GetVisaTypeLoading());
    try {
      final visaTypeModel = await getVisaTypeUseCase.call();

      // Extract visa type names from the model
      final List<String> visaTypeNames =
          visaTypeModel.result?.visaTypes
              ?.map((visaType) => visaType.name ?? '')
              .where((name) => name.isNotEmpty)
              .toList() ??
          [];

      emit(GetVisaTypeLoaded(visaTypeNames));
    } catch (e) {
      emit(GetVisaTypeError(e.toString()));
    }
  }
}
