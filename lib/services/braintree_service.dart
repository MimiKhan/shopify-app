import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:lime_light_copy_shopify_store/services/configs.dart';

class BraintreePaymentService {


  Future<BraintreePaymentMethodNonce?> requestCreditCardPayment({required String cardNumber,
    required String expirationMonth,
    required String expirationYear,
    required String cvv,
    String? cardHolderName,
    required String amount}) async {
    final braintreeCCRequest = BraintreeCreditCardRequest(cardNumber: cardNumber,
        expirationMonth: expirationMonth,
        expirationYear: expirationYear,
        cvv: cvv,
    );

    final result = await Braintree.tokenizeCreditCard(CustomConfig.braintreeTokenizationKey, braintreeCCRequest);
    if(result != null){
      return result;
    }else{
      return null;
    }
  }

  Future<BraintreeDropInResult?> makeGooglePayRequest({required String totalAmount,required String currencyCode})async{
    var request = BraintreeDropInRequest(
      tokenizationKey: CustomConfig.braintreeTokenizationKey,
      collectDeviceData: true,
      googlePaymentRequest: BraintreeGooglePaymentRequest(
        totalPrice: totalAmount,
        currencyCode: currencyCode,
        billingAddressRequired: false,
      ),
      cardEnabled: true,
    );
    final result = await BraintreeDropIn.start(request);

    // if (result != null) {
    //   return result;
    // }
    return result;
}
  Future<BraintreeDropInResult?> makeApplePayRequest({required String countryCode,required String currencyCode})async{
    var request = BraintreeDropInRequest(
      tokenizationKey: CustomConfig.braintreeTokenizationKey,
      collectDeviceData: true,
      applePayRequest: BraintreeApplePayRequest(
          currencyCode: currencyCode,
          supportedNetworks: [
            ApplePaySupportedNetworks.visa,
            ApplePaySupportedNetworks.masterCard,
            ApplePaySupportedNetworks.amex,
            ApplePaySupportedNetworks.discover,
          ],
          countryCode: countryCode,
          merchantIdentifier: '',
          displayName: '',
          paymentSummaryItems: []
      ),
      cardEnabled: true,
    );
    final result = await BraintreeDropIn.start(request);

    // if (result != null) {
    //   return result;
    // }
    return result;
}
}
