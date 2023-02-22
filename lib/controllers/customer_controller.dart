import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/flutter_simple_shopify.dart';
import 'package:lime_light_copy_shopify_store/shopify_models/models/src/shopify_user/address/address.dart';

class CustomerController extends GetxController {

  late Address address;
  var ordersList = <Order>[].obs;


  @override
  void onInit() {
    super.onInit();
  }

  Future<void> addCustomerAddress({
    required String firstName,
    required String lastName,
    required String address1,
    String? address2,
    required String city,
    required String country,
    required String province,
    required String zip,
    required String phone,
    required String customerAccessToken
  }) async {
    var shopifyCustomer = ShopifyCustomer.instance;
    var address = await shopifyCustomer.customerAddressCreate(
      firstName: firstName,
      lastName: lastName,
      address1: address1,
      address2: address2,
      city: city,
      zip: zip,
      phone: phone,
      country: country,
      province: province,
      customerAccessToken: customerAccessToken
    );
    this.address = address;
  }

  Future<void> getCustomersOrders(String accessToken)async{

    ShopifyCheckout shopifyCheckout = ShopifyCheckout.instance;
    var data = await shopifyCheckout.getAllOrders(accessToken,sortKey: SortKeyOrder.PROCESSED_AT);

    if(data == null){
      debugPrint('No orders Yet for this customer.');
    }
    ordersList.value = data ?? <Order>[];

  }
}
