import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/product/product.dart';

class CartController extends GetxController {
  final Map<Product, int> _cartItems = <Product, int>{}.obs;

  Map<Product, int> get cartItems => _cartItems;

  void addProduct(Product product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1;
    } else {
      _cartItems[product] = 1;
    }
    update();
  }

  void removeProduct(Product product) {
    _cartItems.remove(product);
    update();
  }

  void incrementQuantity(Product product) {
    _cartItems[product] = _cartItems[product]! + 1;
    update();
  }

  void decrementQuantity(Product product) {
    _cartItems[product] = _cartItems[product]! - 1;

    if (_cartItems[product] == 0) {
      removeProduct(product);
    }
    update();
  }

  double get totalPrice {
    double sum = 0;
    cartItems.forEach((product, quantity) {
      sum += product.productVariants.first.price.amount * quantity;
    });
    return sum;
  }
}



/*class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  // var cartItemQuantity = <Product,int>{}.obs;

  int get itemsCount => cartItems.length;

  // double get totalPrice => cartItems.fold(
  //     0,
  //     (previousValue, element) =>
  //         previousValue + element.productVariants.first.price.amount);

  addProduct(Product product) {
    cartItems.add(product);
    update();
  }

  removeProduct(Product product){
    cartItems.remove(product);
    update();
  }

  // void incrementQuantity(Product product) {
  //   var quantity = product.productVariants.first.quantityAvailable;
  //   quantity++;
  //   update();
  // }
  //
  // void decrementQuantity(Product product) {
  //   var quantity = product.productVariants.first.quantityAvailable;
  //   quantity--;
  //   if (quantity == 0) {
  //     removeProduct(product);
  //   }
  //   update();
  // }
}*/
