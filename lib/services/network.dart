import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Network {
  // static const String accessToken = '342a0b120c1c13ae1997848236a909bd';
  // static const String appName = 'LimeLightCopy';
  // static String querySingleLine =
  //     "{ shop { name } products(first:2) { nodes { title vendor options { name values } priceRange { maxVariantPrice { amount currencyCode } minVariantPrice { amount currencyCode } } } } }";
  static String querySingleLineWithCollections =
      "{ shop { name } collections(first: 10) { nodes { id title description image { url } } } products(first: 10) { nodes { title vendor options { name values } images(first: 5) { nodes { url } } priceRange { maxVariantPrice { amount currencyCode } minVariantPrice { amount currencyCode } } } } }";
static String queryforCollections =
      "{ shop { name } collections(first: 10) { nodes { id title description image { url } } } }";

//   static void handleError(error) {
//     String errorMessage = error.message ?? '';
//     if (error is BadRequestException) {
//       debugPrint(errorMessage);
//       Fluttertoast.showToast(msg: errorMessage);
//     } else if (error is FetchDataException) {
//       debugPrint(errorMessage);
//       Fluttertoast.showToast(msg: errorMessage);
//     } else if (error is ApiNotRespondingException) {
//       debugPrint(errorMessage);
//       Fluttertoast.showToast(msg: errorMessage);
//     }
//   }
//
//   static Future<StoreFrontDataModel> getShopifyStoreData({required String query}) async {
//
//
//     Future.delayed(const Duration(seconds: 2));
//     var data = await ShopifyStoreFront(accessToken, appName).fetchDataFromShopify(query, handleError).timeout(const Duration(seconds: 15));
//
//     debugPrint('Data from API : ${data.toString()}');
//
//     if (data.isEmpty) {
//       // debugPrint("Error getting Shopify storefront data from api.");
//       throw Exception("Error getting Shopify storefront data from api.");
//     }
//
//     return StoreFrontDataModel.fromJson(json.decode(data));
//   }
//   // Get Collections Data
//   static Future<StoreFrontCollections> getShopifyCollectionsData() async {
//     Future.delayed(const Duration(seconds: 3));
//     var data = await ShopifyStoreFront(accessToken, appName)
//         .fetchDataFromShopify(queryforCollections, handleError);
//
//     debugPrint('Data from API : ${data.toString()}');
//
//     if (data.isEmpty) {
//       // debugPrint("Error getting Shopify storefront data from api.");
//       throw Exception("Error getting Shopify storefront Collections data from API.");
//     }
//     return StoreFrontCollections.fromJson(json.decode(data));
//   }
//
//
//   static Future<SingleProductStoreDataModel> getShopifyProductData({required String dynamicQuery}) async {
//
//     var data = (await ShopifyStoreFront(accessToken, appName)
//         .fetchDataFromShopify(dynamicQuery, handleError)
//         .timeout(const Duration(seconds: 15)));
//
//     debugPrint('Data from API : ${data.toString()}');
//
//     if (data.isEmpty) {
//       // debugPrint("Error getting Shopify storefront data from api.");
//       throw Exception("Error getting Shopify storefront Product data from API.");
//     }
//
//     return SingleProductStoreDataModel.fromJson(json.decode(data));
//   }
//
//   // Get only data.
// static getShopifyStoreProductDataOnly({required String query}) async {
//   var data = await ShopifyStoreFront(accessToken, appName)
//       .fetchDataFromShopify(query, handleError);
//
//   debugPrint('Sample Product Data from API ***: ${data.toString()}  :***');
//
//   if(data.isEmpty){
//     // debugPrint("Error getting Shopify storefront data from api.");
//     throw Exception("Error getting Shopify storefront data from api.");
//   }
// }

}


