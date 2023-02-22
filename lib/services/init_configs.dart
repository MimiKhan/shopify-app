

import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/cart_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/checkout_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/collections_list_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/customer_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/home_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/login_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/product_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/products_list_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/settings_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/wish_list_controller.dart';

class GlobalConfigs extends Bindings{



  // static Future<void> initConfigs() async {
  //   Get.lazyPut(() => HomeController(),fenix: true);
  //   Get.lazyPut(() => CartController(),fenix: true);
  //   Get.lazyPut(() => CollectionsListController(),fenix: true);
  //   Get.lazyPut(() => ProductsListController(),fenix: true);
  //   Get.lazyPut(() => ProductController(),fenix: true);
  //   Get.lazyPut(() => WishListController(),fenix: true);
  //   Get.lazyPut(() => CheckoutController(),fenix: true);
  // }

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(),fenix: true);
    Get.lazyPut(() => CartController(),fenix: true);
    Get.lazyPut(() => CollectionsListController(),fenix: true);
    Get.lazyPut(() => ProductsListController(),fenix: true);
    Get.lazyPut(() => ProductController(),fenix: true);
    Get.lazyPut(() => WishListController(),fenix: true);
    Get.lazyPut(() => CheckoutController(),fenix: true);
    Get.lazyPut(() => SettingsController(),fenix: true);
    Get.lazyPut(() => LoginController(),fenix: true);
    Get.lazyPut(() => CustomerController(),fenix: true);

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
