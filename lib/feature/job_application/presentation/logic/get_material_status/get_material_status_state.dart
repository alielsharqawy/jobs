abstract class GetMaterialStatusState {}

class GetMaterialStatusInitial extends GetMaterialStatusState {}

class GetMaterialStatusLoading extends GetMaterialStatusState {}

class GetMaterialStatusLoaded extends GetMaterialStatusState {
  final List<String> statuses;
  GetMaterialStatusLoaded(this.statuses);
}

class GetMaterialStatusError extends GetMaterialStatusState {
  final String message;
  GetMaterialStatusError(this.message);
}
