

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/enums/src/sort_key_product.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/product/product.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/shopify/src/shopify_store.dart';

class ProductController extends GetxController{

  var productsBySearch = <Product>[].obs;
  var productById = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  Future<void> searchForProducts(String searchKeyword) async {

    try {
      final shopifyStore = ShopifyStore.instance;
      final products = await shopifyStore.getXProductsOnQueryAfterCursor(
        searchKeyword,
        4,
        null,
        sortKey: SortKeyProduct.RELEVANCE,
      );
      Future.delayed(const Duration(seconds: 3));
      productsBySearch.value = products!;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  Future<void> searchForProduct(List<String> searchKeyword) async {

    try {
      final shopifyStore = ShopifyStore.instance;
      final products = await shopifyStore.getProductsByIds(searchKeyword);
      Future.delayed(const Duration(seconds: 3));
      productById.value = products!;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}