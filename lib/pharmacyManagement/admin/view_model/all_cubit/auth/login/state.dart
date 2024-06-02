import 'package:pharmacy_system/pharmacyManagement/admin/model/auth/login.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class ChangePasswordState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {

  final String error ;

  LoginErrorState({required  this.error});
}

class LoginVerifyLoadingState extends LoginStates {}

class LoginVerifySuccessState extends LoginStates {
  final LoginModel loginModel;
  LoginVerifySuccessState({required this.loginModel });
}