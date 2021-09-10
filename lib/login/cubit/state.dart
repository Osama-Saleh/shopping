abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class ChangeVidipitltyPassword extends LoginStates {}

class ShopLoginLoadingState extends LoginStates {}

class ShopLoginSuccessState extends LoginStates {}

class ShopLoginErrorState extends LoginStates {
  final String error;

  ShopLoginErrorState(this.error);
}
