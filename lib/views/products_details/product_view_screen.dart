import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lime_light_copy_shopify_store/core/utils/image_constant.dart';
import 'package:lime_light_copy_shopify_store/core/utils/size_utils.dart';
import 'package:lime_light_copy_shopify_store/theme/app_decoration.dart';
import 'package:lime_light_copy_shopify_store/theme/app_style.dart';
import 'package:lime_light_copy_shopify_store/widgets/custom_button.dart';
import 'package:lime_light_copy_shopify_store/widgets/custom_icon_button.dart';
import 'package:lime_light_copy_shopify_store/widgets/custom_image_view.dart';

class ProductViewScreen extends StatelessWidget {
  const ProductViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: size.height,
                width: size.width,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgProduct,
                      height: getVerticalSize(
                        451.00,
                      ),
                      width: getHorizontalSize(
                        375.00,
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.only(
                        left: 16,
                        top: 26,
                        right: 16,
                        bottom: 26,
                        ),
                        decoration: AppDecoration.fillWhiteA700.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL30,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomIconButton(
                              height: 42,
                              width: 42,
                              alignment: Alignment.centerRight,
                              child: CustomImageView(
                                svgPath: ImageConstant.imgShare,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Order Status",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.gfABeeZeeMediumBlack(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 13),
                              child: Row(
                                children: [
                                  Container(
                                    width: 46.00,
                                    padding: const EdgeInsets.only(
                                      left: 18,
                                      top: 10,
                                      right: 18,
                                      bottom: 10,
                                    ),
                                    decoration: AppDecoration.txtOutlineGray100
                                        .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.txtRoundedBorder12,
                                    ),
                                    child: Text(
                                      "S",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.gfABeeZeeRegularBlack(fontSize: 15),
                                    ),
                                  ),
                                  Container(
                                    width:46.00,
                                    margin: const EdgeInsets.only(
                                      left: 9,
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      top: 10,
                                      right: 16,
                                      bottom: 10,
                                    ),
                                    decoration: AppDecoration.txtOutlineGray100
                                        .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.txtRoundedBorder12,
                                    ),
                                    child: Text(
                                      "M",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.gfABeeZeeRegularBlack(fontSize: 15),
                                    ),
                                  ),
                                  Container(
                                    width:46.00,
                                    margin: const EdgeInsets.only(
                                      left: 9,
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      top: 10,
                                      right: 16,
                                      bottom: 10,
                                    ),
                                    decoration: AppDecoration.txtOutlineGray100
                                        .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.txtRoundedBorder12,
                                    ),
                                    child: Text(
                                      "L",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.gfABeeZeeRegularBlack(fontSize: 15),
                                    ),
                                  ),
                                  Container(
                                    width:46.00,
                                    margin: const EdgeInsets.only(
                                      left: 9,
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 14,
                                      top: 10,
                                      right: 14,
                                      bottom: 10,
                                    ),
                                    decoration:
                                        AppDecoration.txtFillBlack900.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.txtRoundedBorder12,
                                    ),
                                    child: Text(
                                      "XL",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.gfABeeZeeRegularBlack(fontSize: 15),
                                    ),
                                  ),
                                  Container(
                                    width:46.00,
                                    margin: const EdgeInsets.only(
                                      left: 9,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    decoration: AppDecoration.txtOutlineGray100
                                        .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.txtRoundedBorder12,
                                    ),
                                    child: Text(
                                      "XXL",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.gfABeeZeeRegularBlack(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 24),
                              child: Text(
                                "Color",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.gfABeeZeeMediumBlack(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 13),
                              child: TextField(
                                obscureText: false,
                                obscuringCharacter: '*',
                                keyboardType: TextInputType.number,
                                // autoDismissKeyboard: true,
                                // enableActiveFill: true,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (value) {},
                                // pinTheme: PinTheme(
                                //   fieldHeight: getHorizontalSize(
                                //     30.00,
                                //   ),
                                //   fieldWidth: getHorizontalSize(
                                //     30.00,
                                //   ),
                                //   shape: PinCodeFieldShape.box,
                                //   borderRadius: BorderRadius.circular(
                                //     getHorizontalSize(
                                //       8.00,
                                //     ),
                                //   ),
                                //   selectedFillColor: ColorConstant.gray900,
                                //   activeFillColor: ColorConstant.gray900,
                                //   inactiveFillColor: ColorConstant.gray900,
                                //   inactiveColor: ColorConstant.deepPurpleA200,
                                //   selectedColor: ColorConstant.deepPurpleA200,
                                //   activeColor: ColorConstant.deepPurpleA200,
                                // ),
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 24,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Reviews",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.gfABeeZeeMediumBlack(fontSize: 20),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 5,
                                      bottom: 4,
                                    ),
                                    child: Text(
                                      "See All",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.gfABeeZeeMediumBlack(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 14,
                              ),
                              child: Row(
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.imgStar6,
                                    height: getSize(
                                      24.00,
                                    ),
                                    width: getSize(
                                      24.00,
                                    ),
                                    radius: BorderRadius.circular(
                                      getHorizontalSize(
                                        1.00,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 4,
                                    ),
                                    child: Text(
                                      "4.8(1,024 reviews)",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.gfABeeZeeMediumBlack(fontSize: 16)
                                          .copyWith(
                                        letterSpacing: getHorizontalSize(
                                          1.28,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 29,
                                right: 9,
                                bottom: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      top: 15,
                                      bottom: 14,
                                    ),
                                    child: Text(
                                      "\$ 134.98",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.gfABeeZeeRegularBlack(fontSize: 22),
                                    ),
                                  ),
                                  CustomButton(
                                    height: 57,
                                    width: 173,
                                    text: "Add To Cart",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
