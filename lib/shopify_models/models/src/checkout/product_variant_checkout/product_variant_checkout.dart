
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/product/price_v_2/price_v_2.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/product/shopify_image/shopify_image.dart';

part 'product_variant_checkout.freezed.dart';
part 'product_variant_checkout.g.dart';

@freezed
class ProductVariantCheckout with _$ProductVariantCheckout {
  const ProductVariantCheckout._();

  factory ProductVariantCheckout({
    required PriceV2 priceV2,
    required String title,
    required bool availableForSale,
    required String sku,
    required bool requiresShipping,
    required String id,
    ShopifyImage? image,
    PriceV2? compareAtPrice,
    double? weight,
    String? weightUnit,
  }) = _ProductVariantCheckout;

  factory ProductVariantCheckout.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantCheckoutFromJson(json);
}
