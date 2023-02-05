import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/checkout/shipping_rates/shipping_rates.dart';

part 'available_shipping_rates.freezed.dart';
part 'available_shipping_rates.g.dart';

@freezed
class AvailableShippingRates with _$AvailableShippingRates {
  const AvailableShippingRates._();

  factory AvailableShippingRates(
      {required bool ready,
      required List<ShippingRates>? shippingRates}) = _AvailableShippingRates;

  factory AvailableShippingRates.fromJson(Map<String, dynamic> json) =>
      _$AvailableShippingRatesFromJson(json);
}
