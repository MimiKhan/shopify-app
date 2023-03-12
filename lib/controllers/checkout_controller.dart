import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/login_controller.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/enums/src/payment_token_type.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/cart/cart.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/cart/cart_line/cart_line.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/checkout/checkout.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/checkout/line_item/line_item.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/checkout/mailing_address/mailing_address.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/product/price_v_2/price_v_2.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/shopify_user/address/address.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/shopify/src/shopify_cart.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/shopify/src/shopify_checkout.dart';

class CheckoutController extends GetxController {
  late Checkout checkout;
  late Cart cart;

  var paymentDataCreditCard = ''.obs;
  var paymentDataGooglePay = ''.obs;
  var paymentDataApplePay = ''.obs;
  var paymentDataPayPal = ''.obs;

  // late Checkout checkout1

  Future<void> createCartFromUI(
      {required MailingAddress address,
      required List<CartLine> lines,
      required String userAccessToken,
      required String email}) async {
    try {
      final shopifyCart = ShopifyCart.instance;
      await shopifyCart
          .createCart(
              lines: lines,
              userAccessToken: userAccessToken,
              userEmail: email,
              address: address)
          .then((value) {
        cart = value;
        update();
      });
    } catch (e) {
      debugPrint("---** Create Cart **---> $e");
    }
  }

  Future<void> createCheckoutFromCart(
      List<LineItem> lineItems, Address mailingAddress) async {
    try {
      final shopifyCheckout = ShopifyCheckout.instance;

      await shopifyCheckout
          .createCheckout(lineItems: lineItems, mailingAddress: mailingAddress)
          .then((value) async {
        checkout = value;
        // await shopifyCheckout.checkoutCustomerAssociate(
        //     value.id, LoginController().userAccessToken.value);
        update();
      });

      // debugPrint('$checkout');
      //debugPrint('${checkout.shippingLine?.handle ?? 'No Handle'},${checkout.shippingLine}, ${checkout.availableShippingRates?.shippingRates.toString() ?? ''},${checkout.shippingAddress}');
      // update();
    } catch (e) {
      debugPrint("---** Create Checkout **---> $e");
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
    paymentDataCreditCard.value = data.toString();
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
    paymentDataGooglePay.value = data.toString();
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
    paymentDataGooglePay.value = data.toString();
    update();
  }
}
