import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping/components/widgets.dart';
import 'package:shopping/layout/shop_layout/shop_layout.dart';
import 'package:shopping/models/login_model/login_model.dart';
import 'package:shopping/modules/login/cubit/cubit.dart';
import 'package:shopping/modules/login/cubit/states.dart';
import 'package:shopping/modules/register/register_screen.dart';
import 'package:shopping/network/local/cach_helper.dart';


class LoginScreen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
        if (state is ShopLoginSuccessState) {
          if (state.loginmodil.status == true) {
            Fluttertoast.showToast(
                msg: "${state.loginmodil.message}",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            CacheHelper.saveData(
                    key: "token", value: state.loginmodil.data!.token)
                .then((value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShopLayout()));
            });
            // print("Done");
            // print(state.loginmodil.message);
            // print(state.loginmodil.data!.token);
          } else {
            Fluttertoast.showToast(
                msg: "${state.loginmodil.message}",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
            // print(state.loginmodil.message);
            // print(state.loginmodil.data!.token);
          }
        }
      }, builder: (context, state) {
        return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("LOGIN",
                            style:
                                Theme.of(context).textTheme.headline3!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "login now to browse our hot offers",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.grey, fontSize: 20),
                        ),
                        SizedBox(height: 60),
                        defaultTextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Your Email Address";
                            }
                            return null;
                          },
                          controller: emailcontroller,
                          type: TextInputType.emailAddress,
                          lable: "Email Adress",
                          prefixIcon: Icons.mail_outline_outlined,
                        ),
                        SizedBox(height: 30),
                        defaultTextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "password is very short";
                              }
                              return null;
                            },
                            controller: passwordcontroller,
                            type: TextInputType.phone,
                            lable: "Password",
                            obscureText: LoginCubit.get(context).isShowPassword,
                            prefixIcon: Icons.lock_outlined,
                            suffixIcon: LoginCubit.get(context).suffix,
                            suffixpressed: () {
                              LoginCubit.get(context).changevisibilitypass();
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        state is! ShopLoginLoadingState
                            ? Container(
                                width: double.infinity,
                                height: 80,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.indigo.shade500,
                                      Colors.indigoAccent.shade100,
                                      Colors.indigo.shade500
                                    ],
                                  ),
                                ),
                                child: defaultMaterialButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      LoginCubit.get(context).userLogin(
                                        email: emailcontroller.text,
                                        password: passwordcontroller.text,
                                      );
                                    }
                                  },
                                  text: "LOGIN",
                                  border: 30,
                                ),
                              )
                            : Center(child: CircularProgressIndicator()),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.black),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen()));
                                },
                                child: Text("Register"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
      }),
    );
  }
}
