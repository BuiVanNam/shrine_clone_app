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
import 'cart_product.dart';

const String routerListProduct = '/list_product';
const String routerCartProduct = '/cart_product';

const String tagHeroCarProduct = 'cart_product';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {

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
      child: WillPopScope(
          child: HeroControllerScope(
              controller: MaterialApp.createMaterialHeroController(),
              child: Navigator(
                key: _navigatorKey,
                initialRoute: routerListProduct,
                onGenerateRoute: _onGenerateRoute,
              )),
          onWillPop: () async {
            if (_navigatorKey.currentState?.canPop() ?? false) {
              _navigatorKey.currentState?.pop();
              return false;
            } else {}
            return true;
          }),
    );
  }

  static const opacityCurve = const Interval(0.9, 1, curve: Curves.easeInQuart);

  Route? _onGenerateRoute(RouteSettings settings) {
    Widget? page;
    switch (settings.name) {
      case routerListProduct:
        page = HomeListProductPage();
        break;
      case routerCartProduct:
        return PageRouteBuilder<void>(
            transitionDuration: Duration(milliseconds: 300),
            reverseTransitionDuration: Duration(milliseconds: 300),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return AnimatedBuilder(
                  animation: animation,
                  builder: (BuildContext context, Widget? child) {
                    return Opacity(
                      opacity: opacityCurve.transform(animation.value),
                      child: CartProductPage(),
                    );
                  });
            });
    }
    if (page == null) {
      return null;
    }
    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page!;
      },
      settings: settings,
    );
  }
}

//TODO: check dark theme
bool _darkModeEnabled = false;
void _checkIfDarkModeEnabled(BuildContext context) {
  final ThemeData theme = Theme.of(context);
  theme.brightness == Brightness.dark
      ? _darkModeEnabled = true
      : _darkModeEnabled = false;
}

class HomeListProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: const Text('Shop'),
      ),
      body: ProductsPage(),
      drawer: DrawerPage(),
    );
  }
}

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ListProductPage(),
        GestureDetector(
          onTap: () {
            if (Provider.of<HomeModel>(context, listen: false)
                .productsInCart
                .isNotEmpty) {
              Navigator.pushNamed(context, routerCartProduct);
            }
          },
          child: Hero(
            createRectTween: createRectTweenCenter,
            tag: tagHeroCarProduct,
            child: ThumbCart(),
          ),
        )
      ],
    );
  }
}
