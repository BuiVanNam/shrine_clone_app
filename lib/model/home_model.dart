import 'package:flutter/foundation.dart' as foundation;
import 'package:shrine_clone/model/products_repository.dart';
import 'product.dart';

class HomeModel extends foundation.ChangeNotifier {
  ProductRepository? productRepository;

  final List<Product> _listAllProduct = [];

  Category _categoryCurrent = Category.all;

  Category get currentCategory => _categoryCurrent;

  final _productInCart = <int, int>{};

  Map<int, int> get productsInCart {
    return Map.from(_productInCart);
  }

  int getTotalItemInCart() {
    return _productInCart.values.fold(0, (previousValue, element) {
      return previousValue + element;
    });
  }

  void addProductInCart(Product product) {
    int key = product.id;
    if (_productInCart.containsKey(key)) {
      _productInCart.update(key, (value) => value + 1);
    } else {
      _productInCart[key] = 1;
    }
    notifyListeners();
  }

  Product getProductFromKey(int key) {
    return _listAllProduct.firstWhere((element) => element.id == key);
  }

  void loadAllProduct() {
    _listAllProduct.addAll(productRepository?.listProduct ?? []);
    notifyListeners();
  }

  void setCurrentCategory(Category newCategory) {
    if (newCategory != _categoryCurrent) {
      _categoryCurrent = newCategory;
      notifyListeners();
    }
  }

  List<Product> getCurrentProducts() {
    if (_categoryCurrent == Category.all) {
      return List.from(_listAllProduct);
    } else {
      return _listAllProduct.where((element) {
        return element.category == _categoryCurrent;
      }).toList();
    }
  }
}
