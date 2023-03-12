
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/checkout/attribute/attribute.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/checkout/product_variant_checkout/product_variant_checkout.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/order/discount_allocations/discount_allocations.dart';

part 'line_item.freezed.dart';
part 'line_item.g.dart';

@freezed
class LineItem with _$LineItem {
  const LineItem._();
  factory LineItem({
    String? title,
    required int quantity,
    required List<DiscountAllocations> discountAllocations,
    @Default([]) List<Attribute> customAttributes,
    String? variantId,
    String? id,
    ProductVariantCheckout? variant,
  }) = _LineItem;

  static LineItem fromGraphJson(Map<String, dynamic> json) {
    Map<String, dynamic> nodeJson = json['node'] ?? {};

    return LineItem(
        id: nodeJson['id'],
        quantity: nodeJson['quantity'],
        variant: nodeJson['variant'] != null
            ? ProductVariantCheckout.fromJson(nodeJson['variant'])
            : null,
        title: nodeJson['title'],
        discountAllocations: nodeJson['discountAllocations'] == null
            ? []
            : (nodeJson['discountAllocations'] as List)
                .map((e) => DiscountAllocations.fromJson(e))
                .toList());
  }

  factory LineItem.fromJson(Map<String, dynamic> json) => _$LineItemFromJson(json);
}
