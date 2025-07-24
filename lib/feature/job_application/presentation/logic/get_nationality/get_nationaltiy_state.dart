abstract class GetNationalityState {}

class GetNationalityInitial extends GetNationalityState {}

class GetNationalityLoading extends GetNationalityState {}

class GetNationalityLoaded extends GetNationalityState {
  final List<String> nationalities;
  GetNationalityLoaded(this.nationalities);
}

class GetNationalityError extends GetNationalityState {
  final String message;
  GetNationalityError(this.message);
}
