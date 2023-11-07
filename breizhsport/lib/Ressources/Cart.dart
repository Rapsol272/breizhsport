import 'Product.dart';

class Cart {
  final List<Product> items = [];

  void addItem(Product product) {
    items.add(product);
  }

  void clear() {
    items.clear();
  }

  double get total => items.fold(0, (sum, item) => sum + item.price);
}