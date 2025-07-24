import 'package:weather/feature/home/domain/usecase/get_logo_uc.dart';
import 'package:weather/feature/home/presentation/logic/get_logo/get_logo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetLogoCubit extends Cubit<GetLogoState> {
  final GetLogoUC _getLogoUC;
  GetLogoCubit(this._getLogoUC) : super(GetLogoInitial());

  Future<void> getLogo() async {
    emit(GetLogoLoading());
    try {
      final logo = await _getLogoUC.call();
      emit(GetLogoLoaded(logo));
    } catch (e) {
      emit(GetLogoError(e.toString()));
    }
  }
}
