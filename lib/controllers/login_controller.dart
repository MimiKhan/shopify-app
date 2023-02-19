import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/flutter_simple_shopify.dart';

class LoginController extends GetxController {
  late ShopifyUser newUser;
  late ShopifyUser currentUser;
  var userAccessToken = ''.obs;

  Future<void> createUser(
      {String? firstName,
      String? lastName,
      required String email,
      required String password}) async {
    ShopifyAuth shopifyAuth = ShopifyAuth.instance;

    var userData = await shopifyAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName);

    userAccessToken.value = shopifyAuth.currentCustomerAccessToken.toString();

    newUser = userData;
  }

  Future<void> signInWithEmailPass(
      {required String email, required String password}) async {
    ShopifyAuth shopifyAuth = ShopifyAuth.instance;
    var signIn = await shopifyAuth.signInWithEmailAndPassword(
        email: email, password: password);
    debugPrint("Sign in User : ${signIn.id}");
    if (signIn.isNull) {
      debugPrint("Not signed IN...");
    }
    currentUser = signIn;
  }
}
