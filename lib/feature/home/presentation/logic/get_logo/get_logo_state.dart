import 'package:weather/feature/home/data/models/logo_model.dart';

abstract class GetLogoState {}

class GetLogoInitial extends GetLogoState {}

class GetLogoLoading extends GetLogoState {}

class GetLogoLoaded extends GetLogoState {
  final LogoModel logo;

  GetLogoLoaded(this.logo);
}

class GetLogoError extends GetLogoState {
  final String message;

  GetLogoError(this.message);
}
