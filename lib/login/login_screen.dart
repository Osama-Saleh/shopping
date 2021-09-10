import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/components/widgets.dart';
import 'package:shopping/login/cubit/cubit.dart';
import 'package:shopping/login/cubit/state.dart';
import 'package:shopping/register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, stete) {},
          builder: (context, stete) {
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
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
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
                                obscureText:
                                    LoginCubit.get(context).isShowPassword,
                                prefixIcon: Icons.lock_outlined,
                                suffixIcon: LoginCubit.get(context).suffix,
                                suffixpressed: () {
                                  LoginCubit.get(context)
                                      .changevisibilitypass();
                                }),
                            SizedBox(
                              height: 30,
                            ),
                            State is! ShopLoginLoadingState
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
