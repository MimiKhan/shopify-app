import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/flutter_simple_shopify.dart';

class LoginController extends GetxController {
  // late ShopifyUser newUser;
  ShopifyUser? currentUser;
  var userAccessToken = ''.obs;


  Future<ShopifyUser?> checkUser()async{
    ShopifyAuth shopifyAuth = ShopifyAuth.instance;
    var user = await shopifyAuth.currentUser();
    currentUser = user;
    return user;
  }

  Future<void> createUser(
      {String? firstName,

      String? lastName,
      required String email,
      required String password}) async {
    ShopifyAuth shopifyAuth = ShopifyAuth.instance;

    await shopifyAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName);

  }

  Future<void> signInWithEmailPass(
      {required String email, required String password}) async {
    ShopifyAuth shopifyAuth = ShopifyAuth.instance;
    var signIn = await shopifyAuth.signInWithEmailAndPassword(
        email: email, password: password);
    debugPrint("Sign in User : ${signIn.id}");
    userAccessToken.value =  await shopifyAuth.currentCustomerAccessToken ?? '';

    currentUser = signIn;
  }

  Future<void> signout()async{
    ShopifyAuth shopifyAuth = ShopifyAuth.instance;
    await shopifyAuth.signOutCurrentUser();
    userAccessToken.value = '';
    currentUser = null;
  }

  Future<void> forgottenPassword(String email)async{
    ShopifyAuth shopifyAuth = ShopifyAuth.instance;
    await shopifyAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> renewCustomerToken(String userToken)async{
    ShopifyAuth shopifyAuth = ShopifyAuth.instance;
    await shopifyAuth.renewCurrentAccessToken(userAccessToken.value);
    update();
  }

}
