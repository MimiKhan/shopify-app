

import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/cart_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/collections_list_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/home_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/product_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/products_list_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/wish_list_controller.dart';

class GlobalConfigs{

  static Future<void> initConfigs() async {
    Get.lazyPut(() => HomeController(),fenix: true);
    Get.lazyPut(() => CartController(),fenix: true);
    Get.lazyPut(() => CollectionsListController(),fenix: true);
    Get.lazyPut(() => ProductsListController(),fenix: true);
    Get.lazyPut(() => ProductController(),fenix: true);
    Get.lazyPut(() => WishListController(),fenix: true);
  }


}

/*class LazyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController(),fenix: true);
    Get.lazyPut<WishListController>(() => WishListController(),fenix: true);
  }
}

/// Simulates a slow (2 sec.) init of a data access object.
/// Calling [await] dependencies(), your app will wait until dependencies are loaded.
class AwaitBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<HomeController>(() async => HomeController());
    await Get.putAsync<CollectionsListController>(() async => CollectionsListController());
    await Get.putAsync<ProductsListController>(() async => ProductsListController());
    await Get.putAsync<ProductController>(() async => ProductController());
  }
}*/
