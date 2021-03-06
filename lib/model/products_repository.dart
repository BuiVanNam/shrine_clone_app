import 'product.dart';

class ProductRepository {

  List<Product> listProduct = <Product>[
    Product(
        id: 0, name: 'Vagabond sack', category: Category.summer, price: 121),
    Product(
        id: 1, name: 'Stella sunglasses', category: Category.summer, price: 23),
    Product(id: 2, name: 'Whitney belt', category: Category.short, price: 667),
    Product(id: 3, name: 'Garden strand', category: Category.hat, price: 33),
    Product(id: 4, name: 'Strut earrings', category: Category.hat, price: 123),
    Product(id: 5, name: 'Rainwater tray', category: Category.short, price: 89),
    Product(id: 6, name: 'Strut earrings', category: Category.hat, price: 37),
    Product(
        id: 7, name: 'Rainwater tray', category: Category.short, price: 547),
    Product(
        id: 8, name: 'Varsity socks', category: Category.summer, price: 909),
    Product(id: 9, name: 'Whitney belt', category: Category.short, price: 432),
    Product(
        id: 10,
        name: 'Soothe ceramic set',
        category: Category.summer,
        price: 65),
    Product(id: 11, name: 'Whitney belt', category: Category.short, price: 756),
    Product(id: 12, name: 'Strut earrings', category: Category.hat, price: 76),
    Product(id: 13, name: 'Whitney belt', category: Category.hat, price: 345),
    Product(
        id: 14, name: 'Varsity socks', category: Category.short, price: 121),
    Product(id: 15, name: 'Weave keyring', category: Category.hat, price: 64),
    Product(id: 16, name: 'Shrug bag', category: Category.short, price: 21),
    Product(id: 17, name: 'Gilt desk trio', category: Category.hat, price: 898),
    Product(
        id: 18, name: 'Strut earrings', category: Category.short, price: 24),
    Product(
        id: 19, name: 'Whitney belt', category: Category.summer, price: 677),
    Product(id: 20, name: 'Whitney belt', category: Category.short, price: 77),
    Product(
        id: 21, name: 'Strut earrings', category: Category.summer, price: 12),
    Product(id: 22, name: 'Gatsby hat', category: Category.short, price: 898),
    Product(id: 23, name: 'Strut earrings', category: Category.hat, price: 234),
    Product(id: 24, name: 'Strut earrings', category: Category.hat, price: 766),
    Product(
        id: 25, name: 'Varsity socks', category: Category.short, price: 233),
    Product(
        id: 26, name: 'Varsity socks', category: Category.summer, price: 547),
    Product(
        id: 27, name: 'Varsity socks', category: Category.summer, price: 14),
    Product(
        id: 28, name: 'Rainwater tray', category: Category.short, price: 956),
    Product(
        id: 29, name: 'Rainwater tray', category: Category.hat, price: 2323),
    Product(id: 30, name: 'Varsity socks', category: Category.hat, price: 96),
    Product(id: 31, name: 'Varsity socks', category: Category.short, price: 42),
    Product(id: 32, name: 'Rainwater tray', category: Category.hat, price: 86),
    Product(
        id: 33,
        name: 'Succulent planters',
        category: Category.short,
        price: 345),
    Product(id: 34, name: 'Whitney belt', category: Category.summer, price: 64),
    Product(id: 35, name: 'Whitney belt', category: Category.short, price: 112),
    Product(id: 36, name: 'Whitney belt', category: Category.summer, price: 66),
    Product(id: 37, name: 'Whitney belt', category: Category.short, price: 76),
    Product(
        id: 38,
        name: 'Succulent planters',
        category: Category.hat,
        price: 6786),
    Product(id: 39, name: 'Whitney belt', category: Category.short, price: 213),
    Product(id: 40, name: 'Clay sweater', category: Category.summer, price: 32),
    Product(
        id: 41, name: 'Varsity socks', category: Category.short, price: 547),
    Product(
        id: 42,
        name: 'Soothe ceramic set',
        category: Category.summer,
        price: 121),
    Product(id: 43, name: 'Varsity socks', category: Category.short, price: 43),
    Product(
        id: 44, name: 'Succulent planters', category: Category.hat, price: 53),
    Product(id: 45, name: 'Varsity socks', category: Category.hat, price: 767),
    Product(
        id: 46,
        name: 'Soothe ceramic set',
        category: Category.short,
        price: 434),
    Product(
        id: 47, name: 'Succulent planters', category: Category.hat, price: 57),
    Product(
        id: 48,
        name: 'Soothe ceramic set',
        category: Category.short,
        price: 76),
    Product(
        id: 49, name: 'Succulent planters', category: Category.hat, price: 34),
    Product(
        id: 50,
        name: 'Soothe ceramic set',
        category: Category.short,
        price: 2444),
    Product(
        id: 51,
        name: 'Succulent planters',
        category: Category.summer,
        price: 76),
    Product(id: 52, name: 'Varsity socks', category: Category.short, price: 57),
    Product(
        id: 53,
        name: 'Succulent planters',
        category: Category.summer,
        price: 767),
    Product(id: 54, name: 'Varsity socks', category: Category.short, price: 24),
    Product(id: 55, name: 'Varsity socks', category: Category.hat, price: 767),
    Product(
        id: 56, name: 'Succulent planters', category: Category.hat, price: 757),
    Product(
        id: 57, name: 'Varsity socks', category: Category.short, price: 125),
    Product(id: 58, name: 'Varsity socks', category: Category.short, price: 95),
    Product(
        id: 59, name: 'Succulent planters', category: Category.hat, price: 852),
    Product(id: 60, name: 'Varsity socks', category: Category.short, price: 77),
    Product(
        id: 61, name: 'Varsity socks', category: Category.summer, price: 121),
    Product(
        id: 62,
        name: 'Soothe ceramic set',
        category: Category.short,
        price: 574),
    Product(
        id: 63,
        name: 'Succulent planters',
        category: Category.summer,
        price: 56),
    Product(
        id: 64, name: 'Varsity socks', category: Category.short, price: 248),
    Product(
        id: 65,
        name: 'Succulent planters',
        category: Category.hat,
        price: 5434),
    Product(
        id: 66,
        name: 'Soothe ceramic set',
        category: Category.short,
        price: 767),
    Product(
        id: 67, name: 'Varsity socks', category: Category.summer, price: 664),
    Product(
        id: 68,
        name: 'Succulent planters',
        category: Category.short,
        price: 222),
  ];

}
