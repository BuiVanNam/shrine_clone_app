import 'package:flutter/material.dart';
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
          Flexible(
              child: Container(
            height: _sizeItemProduct,
            child: ListThumbProduct(),
          ))
        ],
      ),
    );
  }
}

class ListThumbProduct extends StatefulWidget {
  @override
  _ListThumbProductState createState() => _ListThumbProductState();
}

class _ListThumbProductState extends State<ListThumbProduct> {
  final GlobalKey<AnimatedListState> _globalKeyAnimList = GlobalKey();
  final Set<int> listCart = <int>{};

  void _diffListCart(bool isChangeCount) {
    HomeModel model = Provider.of<HomeModel>(context, listen: false);
    Map<int, int> productInCartModel = model.productsInCart;
    Set<int> listProductInCartModel = productInCartModel.keys.toSet();

    final dif = listProductInCartModel.difference(listCart);
    if (dif.isEmpty) {
      return;
    }

    for (final key in dif) {
      if (listProductInCartModel.length > listCart.length) {
        print('_diffListCart add key: $key');
        listCart.add(key);
        if (isChangeCount) {
          _globalKeyAnimList.currentState?.insertItem(listCart.length - 1,
              duration: const Duration(milliseconds: 300));
        }
      } else {
        print('_diffListCart remove key: $key');
      }
    }
  }

  int _sizeList() {
    int sizeItemList = listCart.length;
    return (sizeItemList <= _maxItemThumb) ? sizeItemList : 4;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.select<HomeModel, Map<int, int>>((value) {
      return value.productsInCart;
    });

    _diffListCart(_sizeList() < 4);

    HomeModel model = Provider.of<HomeModel>(context, listen: false);
    return AnimatedList(
      key: _globalKeyAnimList,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      initialItemCount: _sizeList(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index, anim) {
        if (index <= 2) {
          Product product = model.getProductFromKey(listCart.elementAt(index));
          return _buildAnimationItem(
              child: _buildThumbProduct(
                  product, model.productsInCart[product.id] ?? 0),
              animation: anim);
        } else {
          return _buildAnimationItem(
              child: _buildNumberOtherProduct(), animation: anim);
        }
      },
    );
  }

  Widget _buildAnimationItem(
      {required Widget child, required Animation<double> animation}) {
    Animation<double> animationFinal = animation.drive(
        Tween(begin: 0.0, end: 1.0)
            .chain(CurveTween(curve: Curves.easeInOutQuart)));
    return FadeTransition(
        opacity: animationFinal,
        child: SizeTransition(
          sizeFactor: animationFinal,
          axis: Axis.horizontal,
          axisAlignment: -1.0,
          child: ScaleTransition(scale: animationFinal, child: child),
        ));
  }

  Widget _buildNumberOtherProduct() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Text(
        '+${listCart.length - _maxItemThumb}',
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14),
      ),
    ));
  }

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
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 9),
            ),
          ],
        ));
  }
}
