import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/enums/src/payment_token_type.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/flutter_simple_shopify.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/product/price_v_2/price_v_2.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/shopify_user/address/address.dart';

class CheckoutController extends GetxController {
  late Checkout checkout;

  var paymentDataCC = ''.obs;
  var paymentDataGP = ''.obs;
  var paymentDataAP = ''.obs;

  // late Checkout checkout1

  Future<void> createCheckoutFromCart(
      List<LineItem> lineItems, Address mailingAddress) async {
    try {
      Future.delayed(const Duration(seconds: 1));
      final shopifyCheckout = ShopifyCheckout.instance;

      var checkout = await shopifyCheckout.createCheckout(
          lineItems: lineItems, mailingAddress: mailingAddress);
      this.checkout = checkout;
      debugPrint('${checkout}');
      // debugPrint(
      //     '${checkout.shippingLine?.handle ?? 'No Handle'},${checkout.shippingLine}, ${checkout.availableShippingRates?.shippingRates.toString() ?? ''},${checkout.shippingAddress}');
      update();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Future<void> updateData(Checkout checkoutData)async{
  //   try{
  //
  //     final shopifyCheckout = ShopifyCheckout.instance;
  //     // var data = await shopifyCheckout.getCheckoutInfoQuery(checkout.id,getShippingInfo: true);
  //     await shopifyCheckout.updateAttributes(checkoutData.id,customAttributes: {"availableShippingRates.ready":"true"});
  //     // Address address = Address(
  //     //   firstName: checkout.shippingAddress!.firstName,
  //     // );
  //     // var shippingData = shopifyCheckout.checkoutShippingLineUpdate(checkout.id,checkout.s);
  //     // checkout1 = data;
  //     // debugPrint(data.toString());
  //     update();
  //   }on Exception catch(e){
  //     debugPrint(e.toString());
  //   }
  // }

  Future<void> payWithCreditCard({
    required String checkoutId,
    required PriceV2 price,
    required Address billingAddress,
    required String paymentToken,
    required String paymentType,
    required String idempotencyKey,
  }) async {
    var shopifyCheckout = ShopifyCheckout.instance;
    var data = await shopifyCheckout.completeCheckoutWithTokenizedPaymentV2(
        checkoutId: checkoutId,
        price: price,
        billingAddress: billingAddress,
        impotencyKey: idempotencyKey,
        tokenizedPayment: paymentToken,
        type: paymentType);
    paymentDataCC.value = data.toString();
    update();
  }

  Future<void> payWithGooglePay({
    required String checkoutId,
    required String idempotencyKey,
    required String token,
    required String amount,
    required String currencyCode,
  }) async {
    var shopifyCheckout = ShopifyCheckout.instance;
    var data = await shopifyCheckout.checkoutCompleteWithTokenizedPaymentV3(
        checkoutId,
        checkout: checkout,
        token: token,
        paymentTokenType: PaymentTokenType.GOOGLE_PAY,
        idempotencyKey: idempotencyKey,
        amount: amount,
        currencyCode: currencyCode);
    paymentDataGP.value = data.toString();
    update();
  }

  Future<void> payWithApplePay({
    required String checkoutId,
    required String idempotencyKey,
    required String token,
    required String amount,
    required String currencyCode,
  }) async {
    var shopifyCheckout = ShopifyCheckout.instance;
    var data = await shopifyCheckout.checkoutCompleteWithTokenizedPaymentV3(
        checkoutId,
        checkout: checkout,
        token: token,
        paymentTokenType: PaymentTokenType.APPLE_PAY,
        idempotencyKey: idempotencyKey,
        amount: amount,
        currencyCode: currencyCode);
    paymentDataGP.value = data.toString();
    update();
  }
}
