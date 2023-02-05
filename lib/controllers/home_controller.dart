import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/enums/src/sort_key_collection.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/enums/src/sort_key_product.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/models.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/shopify/src/shopify_store.dart';

class HomeController extends GetxController {
  var bestSellingProducts = <Product>[].obs;
  var collections = <Collection>[].obs;

  int get productsCount => bestSellingProducts.length;
  int get collectionsCount => collections.length;

  // @override
  // void onInit() {
  //   super.onInit();
  //   initData();
  // }



  Future<void> initData() async{
    bestSellingProducts.value = (await _fetchProducts())!;
    collections.value = (await _fetchCollections())!;
  }

  Future<List<Product>?> _fetchProducts() async {
    try {
      // Future.delayed(const Duration(seconds: 1));
      final shopifyStore = ShopifyStore.instance;
      var bestSellingProducts = await shopifyStore.getNProducts(10,
              sortKey: SortKeyProduct.BEST_SELLING);
      return bestSellingProducts;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<Collection>?> _fetchCollections() async {
    try {
      final shopifyStore = ShopifyStore.instance;
      final collections = await shopifyStore.getAllCollections(
          sortKeyCollection: SortKeyCollection.UPDATED_AT);
      return collections;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
