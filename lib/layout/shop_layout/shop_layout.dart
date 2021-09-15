import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/layout/shop_layout/cubit/cubit.dart';
import 'package:shopping/layout/shop_layout/cubit/states.dart';
import 'package:shopping/modules/login/login_screen.dart';
import 'package:shopping/modules/search/search_screen.dart';
import 'package:shopping/network/local/cach_helper.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Salla",
                  style: TextStyle(color: Colors.black),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                    },
                    icon: Icon(Icons.search),
                  )
                ],
              ),
              body: cubit.buttomScreen[cubit.currenIndex],
              bottomNavigationBar: BottomNavigationBar(
                  onTap: (index) {
                    cubit.changebuttomNavegat(index);
                  },
                  currentIndex: cubit.currenIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.category),
                      label: 'Category',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Favorite',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Setting',
                    ),
                  ]));
        },
      ),
    );
  }
}
