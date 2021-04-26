import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shrine_clone/model/home_model.dart';
import 'package:shrine_clone/model/product.dart';
import 'package:shrine_clone/utils/theme.dart';
import 'package:provider/provider.dart';

const double _sizeItemProduct = 48;
const double _marginItemProduct = 3;
const int _maxItemThumb = 3;

class ThumbCart extends StatelessWidget {
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
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          Container(
            height: _sizeItemProduct,
            child: ListThumbProduct(),
          )
        ],
      ),
    );
  }
}

class ListThumbProduct extends StatelessWidget {
  Widget _buildThumbProduct(Product product, int size) {
    return Padding(
      padding: const EdgeInsets.all(_marginItemProduct),
      child: Column(
        children: [
          Expanded(
              child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                product.assetName,
                package: Product.packageAsset,
                fit: BoxFit.cover,
              ),
            ),
          )),
          Text(
            'x$size',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontWeight: FontWeight.w300, color: Colors.white, fontSize: 9),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<int, int> productInCart =
        context.select<HomeModel, Map<int, int>>((value) {
      return value.productsInCart;
    });

    HomeModel model = Provider.of<HomeModel>(context);
    int sizeItemList = productInCart.keys.length;
    int sizeListBuilder = (sizeItemList <= _maxItemThumb) ? sizeItemList : 4;

    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: sizeListBuilder,
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) {
        if (index <= 2) {
          Product product =
              model.getProductFromKey(productInCart.keys.toList()[index]);
          return _buildThumbProduct(product, productInCart[product.id]!);
        } else {
          return Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              '+${sizeItemList - _maxItemThumb}',
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 14),
            ),
          ));
        }
      },
    );
  }
}
