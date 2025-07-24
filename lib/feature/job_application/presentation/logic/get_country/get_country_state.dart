abstract class GetCountryState {}

class GetCountryInitial extends GetCountryState {}

class GetCountryLoading extends GetCountryState {}

class GetCountryLoaded extends GetCountryState {
  final List<String> countries;
  GetCountryLoaded(this.countries);
}

class GetCountryError extends GetCountryState {
  final String message;
  GetCountryError(this.message);
}
