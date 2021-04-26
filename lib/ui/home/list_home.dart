import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shrine_clone/model/home_model.dart';
import 'package:shrine_clone/model/product.dart';

import 'item_shop.dart';

class ListProductPage extends StatelessWidget {
  static const double _marginItemDefault = 14.0;

  @override
  Widget build(BuildContext context) {
    context.select<HomeModel, int>((model) {
      return model.getCurrentProducts().length;
    });

    HomeModel homeModel = Provider.of<HomeModel>(context, listen: false);
    List<Product> listProducts = homeModel.getCurrentProducts();

    return StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(_marginItemDefault),
        physics: const AlwaysScrollableScrollPhysics(
            parent: const BouncingScrollPhysics()),
        crossAxisCount: 2,
        itemCount: listProducts.length,
        crossAxisSpacing: _marginItemDefault,
        mainAxisSpacing: _marginItemDefault * 1.5,
        itemBuilder: (context, index) {
          Product product = listProducts[index];
          return ItemShop(product: product);
        },
        staggeredTileBuilder: (index) {
          double mainAxis;
          if (index.isEven) {
            mainAxis = 1.0;
          } else if (index % 3 == 0) {
            mainAxis = 1.3;
          } else {
            mainAxis = 1.8;
          }
          return StaggeredTile.count(1, mainAxis);
        });
  }
}
