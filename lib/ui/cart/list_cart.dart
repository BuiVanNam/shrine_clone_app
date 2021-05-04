import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shrine_clone/model/home_model.dart';
import 'package:shrine_clone/model/product.dart';
import 'package:provider/provider.dart';
import 'package:shrine_clone/utils/theme.dart';
import 'package:shrine_clone/utils/extension.dart';

class ListCartProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.select<HomeModel, Map<int, int>>((value) {
      return value.productsInCart;
    });

    HomeModel model = Provider.of<HomeModel>(context, listen: false);
    int sizeList = model.productsInCart.keys.length * 2;

    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: sizeList,
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return const Divider(
              height: 1,
            );
          }
          int newIndex = index ~/ 2;
          int key = model.productsInCart.keys.toList()[newIndex];
          Map<Product, int> product = {
            model.getProductFromKey(key): model.productsInCart[key] ?? 0
          };
          return ItemCartProduct(productMap: product);
        });
  }
}

class ItemCartProduct extends StatelessWidget {
  final Map<Product, int> productMap;

  const ItemCartProduct({Key? key, required this.productMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = productMap.keys.toList()[0];
    int size = productMap[product] ?? 0;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              product.assetName,
              package: Product.packageAsset,
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 90,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 15),
                ),
                Text(
                  product.category.toString().replaceAll('Category.', ''),
                  style: const TextStyle(
                      fontSize: 13, color: kSecondaryTextColorLight),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  '${context.currency()}${product.price}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )),
          const SizedBox(
            width: 50,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                customBorder: const CircleBorder(),
                splashColor: kPrimaryRippleColor,
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: kSecondaryTextColorLight,
                ),
                onTap: () {

                },
              ),
              const SizedBox(
                height: 10,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border:
                      Border.all(width: 0.5, color: kSecondaryTextColorLight),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18, top: 4, right: 18, bottom: 4),
                    child: Text(
                      '$size',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: Icon(
                  Icons.remove,
                  size: 20,
                  color: kSecondaryTextColorLight,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
