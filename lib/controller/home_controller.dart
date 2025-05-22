import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart';
import '../modal/product_modal.dart';
// Your Grocery and Product models

class HomeProvider extends ChangeNotifier {
  Grocery? grocery;

  List<Product> filterProductList = [];
  List<Product> cartList = [];

  void addToCart(Product product) {
    cartList.add(product);
    notifyListeners();
  }

  String language = 'english';
  Future<List<Product>> fetchData(String value) async {
     language = value;

    final String jsonString = await rootBundle.loadString('assets/path.json');

    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    print('$jsonMap');

    // Parse full Grocery data
    grocery = Grocery.fromJson(jsonMap);

    // Filter products based on language key
    switch (language.toLowerCase()) {
      case 'english':
        filterProductList = grocery?.english ?? [];
        break;
      case 'hindi':
        filterProductList = grocery?.hindi ?? [];
        break;
      case 'gujarati':
        filterProductList = grocery?.gujarati ?? [];
        break;
    }

    notifyListeners();
    return filterProductList;
  }

  void removeFromCart(int index) {
    cartList.removeAt(index);
    notifyListeners();
  }


  void clearCart() {
    cartList.clear();
    notifyListeners();
  }
}
