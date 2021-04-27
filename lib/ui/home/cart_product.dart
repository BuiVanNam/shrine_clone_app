import 'package:flutter/material.dart';
import 'package:shrine_clone/ui/home/shop.dart';
import 'package:shrine_clone/utils/extension.dart';
import 'package:shrine_clone/utils/theme.dart';

class CartProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
          createRectTween: createRectTweenCenter,
          tag: tagHeroCarProduct,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: kAccentColor,
          )),
    );
  }
}
