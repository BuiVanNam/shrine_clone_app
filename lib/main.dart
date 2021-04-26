import 'package:flutter/material.dart';
import 'package:shrine_clone/ui/home/shop.dart';
import 'package:shrine_clone/ui/login/login.dart';
import 'package:shrine_clone/utils/shared_preferences.dart';
import 'package:shrine_clone/utils/theme.dart';

const String routerLogin = '/login';
const String routerHomeShop = '/home_shop';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isLogin = await LoginUtils.isLogin();
  String routerHome = isLogin ? routerHomeShop : routerLogin;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: kThemeLight,
    darkTheme: kThemeDark,
    initialRoute: routerHome,
    routes: {
      routerLogin: (context) => LoginPage(),
      routerHomeShop: (context) => ShopPage(),
    },
  ));
}
