
abstract class GetVisaTypeState {}

class GetVisaTypeInitial extends GetVisaTypeState {}

class GetVisaTypeLoading extends GetVisaTypeState {}

class GetVisaTypeLoaded extends GetVisaTypeState {
  final List<String> visaType;

  GetVisaTypeLoaded(this.visaType);
}

class GetVisaTypeError extends GetVisaTypeState {
  final String message;

  GetVisaTypeError(this.message);
}
