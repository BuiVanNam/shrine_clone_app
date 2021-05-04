import 'package:flutter/material.dart';
import 'package:shrine_clone/ui/home/shop.dart';
import 'package:shrine_clone/ui/login/login.dart';
import 'package:shrine_clone/utils/shared_preferences.dart';
import 'package:shrine_clone/utils/theme.dart';
import 'package:shrine_clone/utils/extension.dart';

const String routerLogin = '/login';
const String routerHomeShop = '/home_shop';

//TODO: write test
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
      routerLogin: (context) => _SystemTheme(child: LoginPage()),
      routerHomeShop: (context) => _SystemTheme(child: ShopPage()),
    },
  ));
}

class _SystemTheme extends StatelessWidget {
  final Widget child;

  const _SystemTheme({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      child: child,
      value: context.darkModeEnabled() ? darkSystemUi : lightSystemUi,
    );
  }
}
