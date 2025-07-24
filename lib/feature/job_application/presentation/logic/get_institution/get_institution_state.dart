abstract class GetInstitutionState {}

class GetInstitutionInitial extends GetInstitutionState {}

class GetInstitutionLoading extends GetInstitutionState {}

class GetInstitutionLoaded extends GetInstitutionState {
  final List<String> institutions;
  GetInstitutionLoaded(this.institutions);
}

class GetInstitutionError extends GetInstitutionState {
  final String message;
  GetInstitutionError(this.message);
}
