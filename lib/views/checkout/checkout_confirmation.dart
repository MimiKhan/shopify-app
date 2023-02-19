import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/checkout_controller.dart';

class CheckoutConfirmation extends StatelessWidget {
  CheckoutConfirmation({Key? key}) : super(key: key);

  final checkoutController = Get.find<CheckoutController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GetX<CheckoutController>(
                builder: (controller) {
                  return Text(checkoutController.paymentDataCC.value);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
