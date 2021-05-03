import 'package:flutter/material.dart';
import 'package:shrine_clone/ui/home/shop.dart';
import 'package:shrine_clone/utils/extension.dart';

class CartProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ThemeData themeData = Theme.of(context);

    return Hero(
      createRectTween: createRectTweenCenter,
      tag: tagHeroCarProduct,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: themeData.scaffoldBackgroundColor,
          title: Text('Cart Product', style: TextStyle(color: themeData.textTheme.bodyText1!.color)),
        ),
        // body: SafeArea(
        //   child: Column(
        //     children: [Divider()],
        //   ),
        // ),
      ),
    );
  }
}
