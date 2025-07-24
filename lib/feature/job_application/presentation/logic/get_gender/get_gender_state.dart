abstract class GetGenderState {}

class GetGenderInitial extends GetGenderState {}

class GetGenderLoading extends GetGenderState {}

class GetGenderLoaded extends GetGenderState {
  final List<String> genders;
  GetGenderLoaded(this.genders);
}

class GetGenderError extends GetGenderState {
  final String message;
  GetGenderError(this.message);
}
