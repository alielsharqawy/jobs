import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/feature/job_application/domain/usecase/get_country_uc.dart';
import 'package:weather/feature/job_application/presentation/logic/get_country/get_country_state.dart';

class GetCountryCubit extends Cubit<GetCountryState> {
  final GetCountryUseCase _getCountryUseCase;
  GetCountryCubit(this._getCountryUseCase) : super(GetCountryInitial());

  Future<void> fetchCountries() async {
    try {
      emit(GetCountryLoading());
     
      final countryModel = await _getCountryUseCase.call();
      
      // Extract country names from the model
      final List<String> countryNames = countryModel.result?.countries
          ?.map((country) => country.name ?? '')
          .where((name) => name.isNotEmpty)
          .toList() ?? [];
      
      emit(GetCountryLoaded(countryNames));
    } catch (e) {
      emit(GetCountryError('Failed to load countries: $e'));
    }
  }
}
