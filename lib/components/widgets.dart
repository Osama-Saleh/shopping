import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? lable,
  required String? Function(String? value)? validator,
  Function()? suffixpressed,
  bool obscureText = false,
  IconData? suffixIcon,
  IconData? prefixIcon,
  context,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: obscureText,
    validator: validator,
    decoration: InputDecoration(
      labelText: lable,
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.blue,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 2.0,
        ),
      ),
      suffixIcon: IconButton(onPressed: suffixpressed, icon: Icon(suffixIcon)),
      prefixIcon: Icon(prefixIcon),
    ),
  );
}

Widget defaultMaterialButton({
  required Function()? onPressed,
  required String text,
  Color? buttonColor,
  Color? textColor,
  double? border,
}) {
  return MaterialButton(
    onPressed: onPressed,
    color: buttonColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(border!),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 40,
      ),
    ),
  );
}
