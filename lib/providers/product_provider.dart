import 'package:flutter/foundation.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => [..._products];

  void addProduct(Product product) {
    _products.insert(0, product); // 최신 상품을 맨 앞에 추가
    notifyListeners();
  }

  void deleteProduct(String id) {
    _products.removeWhere((product) => product.id == id);
    notifyListeners();
  }
}
