import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/product/product.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/shopify/src/shopify_store.dart';

class ProductsListController extends GetxController{
  var productsList = <Product>[].obs;
  int get productsCount => productsList.length;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final shopifyStore = ShopifyStore.instance;
      final allProducts = await shopifyStore.getAllProducts();
      Future.delayed(const Duration(seconds: 3));
      productsList.value = allProducts;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}