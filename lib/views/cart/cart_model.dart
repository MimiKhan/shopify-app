

import 'package:lime_light_copy_shopify_store/shopify_models/models/src/product/product.dart';

class CartModel{
  final Product product;
  int quantity;

  CartModel({required this.product, required this.quantity});
}