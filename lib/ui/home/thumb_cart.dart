import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shrine_clone/model/product.dart';
import 'package:shrine_clone/utils/theme.dart';

class ThumbCart extends StatelessWidget {
  static double _sizeItemProduct = 48;
  static double _marginItemProduct = 6;

  double _sizeItemThumb() {
    return _sizeItemProduct - _marginItemProduct * 2;
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          color: kColorBgThumbCart,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          Container(
              height: _sizeItemProduct,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  // _buildThumbProduct(),
                  // _buildThumbProduct(),
                  // _buildThumbProduct(),
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildThumbProduct() {
    return Padding(
      padding: EdgeInsets.all(_marginItemProduct),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          '${2 % 37}-0.jpg',
          package: Product.packageAsset,
          fit: BoxFit.cover,
          width: _sizeItemThumb(),
        ),
      ),
    );
  }
}
