import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/customer_controller.dart';
import 'package:lime_light_copy_shopify_store/controllers/login_controller.dart';
import 'package:lime_light_copy_shopify_store/core/utils/color_constant.dart';
import 'package:lime_light_copy_shopify_store/theme/app_style.dart';

class ProfileAddAddressScreen extends StatefulWidget {
  const ProfileAddAddressScreen({Key? key}) : super(key: key);

  @override
  State<ProfileAddAddressScreen> createState() =>
      _ProfileAddAddressScreenState();
}

class _ProfileAddAddressScreenState extends State<ProfileAddAddressScreen> {
  final loginController = Get.find<LoginController>();
  final customerController = Get.find<CustomerController>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _address1Controller = TextEditingController();
  final _address2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _provinceController = TextEditingController();
  final _countryController = TextEditingController();
  final _zipController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstNameController.text = '${loginController.currentUser?.firstName}';
    _lastNameController.text = '${loginController.currentUser?.lastName}';
    _address1Controller.text = 'Chak # 91/9-L Arifwala road';
    _address2Controller.text = 'Opposite M.A. Foods';
    _cityController.text = 'Sahiwal';
    _provinceController.text = 'Punjab';
    _countryController.text = 'Pakistan';
    _zipController.text = '57000';
    _phoneController.text = '+923009691591';
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // set the color of the back icon here
        ),
        backgroundColor: Colors.black,
        title: Text(
          'Add Address',
          style: AppStyle.txtPoppinsMedium20.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                '* Please provide required information to add new address.',
                style: AppStyle.txtPoppinsMedium14,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: size.width - 51,
                  height: 50,
                  child: TextField(
                    controller: _firstNameController,
                    style: AppStyle.txtInterRegular22,
                    decoration: InputDecoration(
                      label: Text(
                        'First Name',
                        style: AppStyle.txtPoppinsMedium20,
                      ),
                      filled: true,
                      fillColor: ColorConstant.gray100,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: size.width - 51,
                  height: 50,
                  child: TextField(
                    controller: _lastNameController,
                    style: AppStyle.txtInterRegular22,
                    decoration: InputDecoration(
                      label: Text(
                        'Last Name',
                        style: AppStyle.txtPoppinsMedium20,
                      ),
                      filled: true,
                      fillColor: ColorConstant.gray100,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      constraints:
                          const BoxConstraints(maxWidth: 380, maxHeight: 60),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: size.width - 51,
                  height: 50,
                  child: TextField(
                    controller: _address1Controller,
                    style: AppStyle.txtInterRegular22,
                    decoration: InputDecoration(
                      label: Text(
                        'Address 1',
                        style: AppStyle.txtPoppinsMedium20,
                      ),
                      filled: true,
                      fillColor: ColorConstant.gray100,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      constraints:
                          const BoxConstraints(maxWidth: 380, maxHeight: 60),
                    ),
                    keyboardType: TextInputType.streetAddress,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: size.width - 51,
                  height: 50,
                  child: TextField(
                    controller: _address2Controller,
                    style: AppStyle.txtInterRegular22,
                    decoration: InputDecoration(
                      label: Text(
                        'Address 2 (Optional)',
                        style: AppStyle.txtPoppinsMedium20,
                      ),
                      filled: true,
                      fillColor: ColorConstant.gray100,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      constraints:
                          const BoxConstraints(maxWidth: 380, maxHeight: 60),
                    ),
                    keyboardType: TextInputType.streetAddress,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: size.width - 51,
                  height: 50,
                  child: TextField(
                    controller: _cityController,
                    style: AppStyle.txtInterRegular22,
                    decoration: InputDecoration(
                      label: Text(
                        'City',
                        style: AppStyle.txtPoppinsMedium20,
                      ),
                      filled: true,
                      fillColor: ColorConstant.gray100,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      constraints:
                          const BoxConstraints(maxWidth: 380, maxHeight: 60),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: size.width - 51,
                  height: 50,
                  child: TextField(
                    controller: _provinceController,
                    style: AppStyle.txtInterRegular22,
                    decoration: InputDecoration(
                      label: Text(
                        'Province',
                        style: AppStyle.txtPoppinsMedium20,
                      ),
                      filled: true,
                      fillColor: ColorConstant.gray100,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      constraints:
                          const BoxConstraints(maxWidth: 380, maxHeight: 60),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: size.width - 51,
                  height: 50,
                  child: TextField(
                    controller: _countryController,
                    style: AppStyle.txtInterRegular22,
                    decoration: InputDecoration(
                      label: Text(
                        'Country',
                        style: AppStyle.txtPoppinsMedium20,
                      ),
                      filled: true,
                      fillColor: ColorConstant.gray100,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      constraints:
                          const BoxConstraints(maxWidth: 380, maxHeight: 60),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: size.width - 51,
                  height: 50,
                  child: TextField(
                    controller: _zipController,
                    style: AppStyle.txtInterRegular22,
                    decoration: InputDecoration(
                      label: Text(
                        'Zip Code',
                        style: AppStyle.txtPoppinsMedium20,
                      ),
                      filled: true,
                      fillColor: ColorConstant.gray100,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      constraints:
                          const BoxConstraints(maxWidth: 380, maxHeight: 60),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: size.width - 51,
                  height: 50,
                  child: TextField(
                    controller: _phoneController,
                    style: AppStyle.txtInterRegular22,
                    decoration: InputDecoration(
                      label: Text(
                        'Phone Number',
                        style: AppStyle.txtPoppinsMedium20,
                      ),
                      filled: true,
                      fillColor: ColorConstant.gray100,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 1.2, color: ColorConstant.black900)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      constraints:
                          const BoxConstraints(maxWidth: 380, maxHeight: 60),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: size.width - 101,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          shadowColor: ColorConstant.blueGray100),
                      onPressed: () async {
                        String firstName = _firstNameController.text;
                        String lastName = _lastNameController.text;
                        String address1 = _address1Controller.text;
                        String address2 = _address2Controller.text;
                        String city = _cityController.text;
                        String province = _provinceController.text;
                        String country = _countryController.text;
                        String zip = _zipController.text;
                        String phone = _phoneController.text;
                        String accessToken = loginController.userAccessToken.value.toString();


                        await customerController.addCustomerAddress(
                            firstName: firstName,
                            lastName: lastName,
                            address1: address1,
                            address2: address2,
                            city: city,
                            country: country,
                            province: province,
                            zip: zip,
                            phone: phone,
                            customerAccessToken: accessToken
                        ).then((value) {
                          showDoneDialog();
                          Future.delayed(const Duration(seconds: 2));
                          Get.offNamed('/profileScreen');
                        }).onError((error, stackTrace) {
                          debugPrint("Error : ${error.toString()}:");
                          showErrorMessage(error.toString());
                        });
                      },
                      child: Text(
                        'Add Address',
                        style: AppStyle.txtPlayfairDisplayMedium26,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showDoneDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Congratulations!"),
          content: const Text("You have successfully added your address."),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
