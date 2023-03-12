import 'package:flutter/material.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/checkout/checkout.dart';
import 'package:lime_light_copy_shopify_store/theme/app_style.dart';

class PaypalWidget extends StatefulWidget {
  PaypalWidget({Key? key, required this.checkout}) : super(key: key);

  Checkout checkout;

  @override
  State<PaypalWidget> createState() => _PaypalWidgetState();
}

class _PaypalWidgetState extends State<PaypalWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("Checkout/WebUrl ***CheckoutScreen***: ${widget.checkout.webUrl.toString()}");
    debugPrint("Checkout/ShippingData ***CheckoutScreen***: ${widget.checkout.shippingLine.toString()}");

  }
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Coming Soon',style: AppStyle.gfABeeZeeMediumBlack(fontSize: 18),),);
  }
}
