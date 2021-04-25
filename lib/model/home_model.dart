import 'package:flutter/foundation.dart' as foundation;
import 'product.dart';

class HomeModel extends foundation.ChangeNotifier {
  final List<Product> _listAllProduct = [];

  Category _categoryCurrent = Category.all;

  final List<Product> _listProductInCart = [];


}
