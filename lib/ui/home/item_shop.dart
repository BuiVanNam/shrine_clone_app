import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrine_clone/model/home_model.dart';
import 'package:shrine_clone/model/product.dart';
import 'package:shrine_clone/utils/theme.dart';
import 'package:shrine_clone/utils/extension.dart';

//TODO: cache image

class ItemShop extends StatelessWidget {
  final Product product;

  const ItemShop({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  product.assetName,
                  package: Product.packageAsset,
                  fit: BoxFit.cover,
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${product.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            '${context.currency()}${product.price}${product.category.toString().replaceAll('Category', '')}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w300,
                color: kSecondaryTextColorLight),
          )
        ],
      ),
      onTap: () {
        Provider.of<HomeModel>(context, listen: false).addProductInCart(product);
      },
    );
  }
}
