

import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/product/product.dart';

class WishListController extends GetxController{

  var products = <Product>[].obs;

  int get itemsCount => products.length;



  addProductToWishList(Product product){
    products.add(product);
    update();
  }

  removeProductFromWishList(Product product){
    products.remove(product);
    update();
  }

}