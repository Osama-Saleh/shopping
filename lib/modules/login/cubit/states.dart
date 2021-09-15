import 'package:shopping/models/login_model/login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class ChangeVidipitltyPassword extends LoginStates {}

class ShopLoginLoadingState extends LoginStates {}

class ShopLoginSuccessState extends LoginStates {
  final LoginModel loginmodil;

  ShopLoginSuccessState(this.loginmodil);
}

class ShopLoginErrorState extends LoginStates {
  final String error;

  ShopLoginErrorState(this.error);
}
