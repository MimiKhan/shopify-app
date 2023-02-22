import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/login_controller.dart';
import 'package:lime_light_copy_shopify_store/theme/app_decoration.dart';
import 'package:lime_light_copy_shopify_store/theme/app_style.dart';

class ProfileAddressDetailScreen extends StatelessWidget {
  ProfileAddressDetailScreen({Key? key}) : super(key: key);

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/profileAddAddressScreen');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text(
                      'Add New Address',
                      style: TextStyle(
                          color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Text(
                'Current Addresses',
                style: AppStyle.txtLatoBold24,
              ),
              loginController.currentUser?.address?.addressList.length == 0
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 35.0),
                            child: Text('No Address Found',
                                style: AppStyle.txtInterRegular22),
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed('/profileAddAddressScreen');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              child: const Text(
                                'Add New Address',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: loginController
                          .currentUser?.address?.addressList.length,
                      padding: const EdgeInsets.only(top: 20),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: size.width - 21,
                          height: 335,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            shape: BoxShape.rectangle,
                            color: Colors.grey.shade200,
                            border: Border.all(color: Colors.black26,width: 1.3),
                          ),
                          child: Column(
                            children: [
                              // Address name and Edit Button
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        '${loginController.currentUser?.address?.addressList[index].name}'),
                                    TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: const [
                                          Icon(CupertinoIcons.pen),
                                          Text('Edit'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15,),
                              // First and Last Name
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Name',
                                      style: AppStyle.txtLatoRegular15,
                                    ),
                                    Text(
                                      '${loginController.currentUser?.address?.addressList[index].firstName} ${loginController.currentUser?.address?.addressList[index].lastName}',
                                      style: AppStyle.txtMontserratMedium15,
                                    ),
                                  ],
                                ),
                              ),
                              // Address 1
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Address 1',
                                      style: AppStyle.txtLatoRegular15,
                                    ),
                                    Text(
                                      '${loginController.currentUser?.address?.addressList[index].address1.toString()}',
                                      style: AppStyle.txtMontserratMedium15,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                              // Address 2
                              Offstage(
                                offstage: loginController.currentUser?.address
                                        ?.addressList[index].address2 ==
                                    null,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 7),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Address 2',
                                        style: AppStyle.txtLatoRegular15,
                                      ),
                                      Text(
                                        '${loginController.currentUser?.address?.addressList[index].address2}',
                                        style: AppStyle.txtMontserratMedium15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // City
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'City',
                                      style: AppStyle.txtLatoRegular15,
                                    ),
                                    Text(
                                      '${loginController.currentUser?.address?.addressList[index].city}',
                                      style: AppStyle.txtMontserratMedium15,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                              // Province
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Province/State',
                                      style: AppStyle.txtLatoRegular15,
                                    ),
                                    Text(
                                      '${loginController.currentUser?.address?.addressList[index].province} ${loginController.currentUser?.address?.addressList[index].provinceCode ?? ''}',
                                      style: AppStyle.txtMontserratMedium15,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                              // Country
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Country',
                                      style: AppStyle.txtLatoRegular15,
                                    ),
                                    Text(
                                      '${loginController.currentUser?.address?.addressList[index].country} ${loginController.currentUser?.address?.addressList[index].countryCode?? ''}',
                                      style: AppStyle.txtMontserratMedium15,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                              // Zip
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Zip Code',
                                      style: AppStyle.txtLatoRegular15,
                                    ),
                                    Text(
                                      '${loginController.currentUser?.address?.addressList[index].zip}',
                                      style: AppStyle.txtMontserratMedium15,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                              // Phone
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Phone #',
                                      style: AppStyle.txtLatoRegular15,
                                    ),
                                    Text(
                                      '${loginController.currentUser?.address?.addressList[index].phone}',
                                      style: AppStyle.txtMontserratMedium15,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
