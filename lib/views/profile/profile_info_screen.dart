import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lime_light_copy_shopify_store/controllers/login_controller.dart';
import 'package:lime_light_copy_shopify_store/core/utils/color_constant.dart';
import 'package:lime_light_copy_shopify_store/theme/app_style.dart';

class ProfileInfoScreen extends StatefulWidget {
  ProfileInfoScreen({Key? key}) : super(key: key);

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  final loginController = Get.find<LoginController>();

  final _firstNameController = TextEditingController();

  final _lastNameController = TextEditingController();

  final _emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstNameController.text = '${loginController.currentUser?.firstName}';
    _lastNameController.text = '${loginController.currentUser?.lastName}';
    _emailController.text = '${loginController.currentUser?.email}';
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'First Name',
                  style: AppStyle.txtMontserratMedium18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: size.width - 51,
                height: 40,
                child: TextField(
                  enabled: false,
                  controller: _firstNameController,
                  style: AppStyle.txtMontserratMedium18,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorConstant.gray100,
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Last Name',
                  style: AppStyle.txtMontserratMedium18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: size.width - 51,
                height: 40,
                child: TextField(
                  enabled: false,
                  controller: _lastNameController,
                  style: AppStyle.txtMontserratMedium18,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorConstant.gray100,
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Email',
                  style: AppStyle.txtMontserratMedium18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: size.width - 51,
                height: 40,
                child: TextField(
                  enabled: false,
                  controller: _emailController,
                  style: AppStyle.txtMontserratMedium18,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorConstant.gray100,
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
