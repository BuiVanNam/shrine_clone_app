enum Category { all, summer, short, hat }

class Product {
  final int id;
  final String name;
  final double price;
  final Category category;
  final assetName;

  const Product(
      {required this.id,
      required this.name,
      required this.category,
      required this.price})
      : this.assetName = '${id % 37}-0.jpg';

  @override
  String toString() => 'Product: $id - $name - $category - $price';

  static const packageAsset = 'shrine_images';
}
