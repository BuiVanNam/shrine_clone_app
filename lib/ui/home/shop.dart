import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shrine_clone/model/home_model.dart';
import 'package:shrine_clone/model/products_repository.dart';
import 'package:shrine_clone/ui/home/drawer_menu.dart';
import 'package:shrine_clone/ui/home/list_home.dart';
import 'package:shrine_clone/utils/extension.dart';
import 'package:shrine_clone/utils/theme.dart';
import 'thumb_cart.dart';

class ShopPage extends StatelessWidget {
  void _setupForSystemView(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1)).then((value) {
      bool darkModeOn = context.isDarkTheme();
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor:
              darkModeOn ? kBackgroundColorDark : kBackgroundColorLight,
          systemNavigationBarDividerColor:
              darkModeOn ? Colors.black : Colors.white,
          systemNavigationBarIconBrightness:
              darkModeOn ? Brightness.light : Brightness.dark));
    });
  }

  @override
  Widget build(BuildContext context) {
    // _setupForSystemView(context);

    Widget child = Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: const Text('Shop'),
      ),
      body: HomePage(),
      drawer: DrawerPage(),
    );

    return MultiProvider(
      providers: [
        Provider(create: (_) => ProductRepository()),
        ChangeNotifierProxyProvider<ProductRepository, HomeModel>(
            create: (_) => HomeModel(),
            update: (_, repository, model) {
              if (model == null) {
                throw ArgumentError.notNull('HomeModel');
              }
              model
                ..productRepository = repository
                ..loadAllProduct();
              return model;
            })
      ],
      child: child,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ListProductPage(),
        ThumbCart(),
      ],
    );
  }
}
