import 'package:flutter/material.dart';
import 'package:shopping/modules/login/login_screen.dart';
import 'package:shopping/network/local/cach_helper.dart';

void logout(context)
{
   CacheHelper.removeData(key: "token").then((value) {
            if (value)
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
          });
}