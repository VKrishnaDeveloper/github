import 'package:get/get.dart';

import '../../core/model/model_class.dart';

class CartController extends GetxController {
  var products = {}.obs;
  void addProduct(MyHubProductsModel product) {
    if (products.containsKey(product)) {
      products[product] += 1;
    } else {
      products[product] = 1;
    }

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("")));
    Get.snackbar("${product.productTitle}", "Added to the cart",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2));
  }

  void removeProducts(MyHubProductsModel product) {
    if (products.containsKey(product) && products[product] == 1) {
      products.removeWhere((key, value) => key == product);
    } else {
      products[product] -= 1;
    }
  }

  get cartProducts {
    return products;
  }

  get producteCount => products.length;

  get productSubTotal => products.entries
      .map((product) => product.key.productPrice * product.value)
      .toList();

  get totalCount => products.entries
      .map((product) => product.key.productPrice * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
