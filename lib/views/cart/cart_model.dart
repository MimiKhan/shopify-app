

import 'package:lime_light_copy_shopify_store/shopify_models/flutter_simple_shopify.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/product/product.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/product/product_variant/product_variant.dart';

class CartModel{
  Product product;
  int quantity;
  ProductVariant productVariant;

  CartModel({required this.productVariant, required this.product, required this.quantity});
}