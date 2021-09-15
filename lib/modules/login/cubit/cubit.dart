import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping/models/login_model/login_model.dart';
import 'package:shopping/modules/login/cubit/states.dart';
import 'package:shopping/network/end_Point/endpoint.dart';
import 'package:shopping/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    ///
     emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      "email": email,
      "password": password,
    }).then((value) {
      // print("the value $value");
      loginModel = LoginModel.fromMap(value.data);
      // print(loginModel!.message);
      // print(loginModel!.data!.token);
      emit(ShopLoginSuccessState(loginModel!));
    }).catchError((onError) {
      print("ُErrors $onError");
      emit(ShopLoginErrorState(onError.toString()));
    });
  }

  IconData suffix = Icons.visibility;
  bool isShowPassword = true;
  void changevisibilitypass() {
    isShowPassword = !isShowPassword;
    suffix = isShowPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangeVidipitltyPassword());
  }
}
