import 'package:flutter/material.dart';
import 'package:shrine_clone/model/home_model.dart';
import 'package:shrine_clone/ui/home/shop.dart';
import 'package:shrine_clone/utils/extension.dart';
import 'package:shrine_clone/utils/theme.dart';
import 'package:shrine_clone/ui/custom/dashed_line.dart';
import 'package:shrine_clone/ui/cart/list_cart.dart';
import 'package:provider/provider.dart';

class CartProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      createRectTween: createRectTweenCenter,
      tag: tagHeroCarProduct,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              const Divider(
                height: 1,
              ),
              Flexible(child: ListCartProduct(), flex: 10,),
              const SizedBox(
                height: 36,
              ),
              Flexible(child: OrderCart(),),
              const SizedBox(
                height: 36,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Align(
              child: Text(
            'Cart Product',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: themeData.textTheme.bodyText1?.color),
          )),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class OrderCart extends StatelessWidget {
  final sizeBoxMain = const SizedBox(
    width: 24,
    height: 48,
  );

  @override
  Widget build(BuildContext context) {
    double priceTotal = context.select<HomeModel, double>((value) {
      return value.getTotalPriceInCart();
    });

    return Card(
      color: kAccentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: const EdgeInsets.only(left: 24, right: 24),
      borderOnForeground: true,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizeBoxMain,
            Flexible(
                child: const Text(
              'ORDER CART',
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.white),
            )),
            sizeBoxMain,
            SizedBox(
                height: 20,
                child: CustomPaint(
                  painter: DashedLinePainter(),
                )),
            sizeBoxMain,
            Flexible(
                child: Text(
              '${context.currency()}$priceTotal',
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white),
            )),
            sizeBoxMain,
          ],
        ),
      ),
    );
  }
}
