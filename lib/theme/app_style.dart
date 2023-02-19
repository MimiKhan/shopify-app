import 'package:flutter/material.dart';
import 'package:lime_light_copy_shopify_store/core/utils/color_constant.dart';
import 'package:lime_light_copy_shopify_store/core/utils/size_utils.dart';

class AppStyle {
  static TextStyle txtPoppinsMedium14 = TextStyle(
    color: ColorConstant.orange700,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsSemiBold16 = TextStyle(
    color: ColorConstant.gray500,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtPoppinsMedium20 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtInterRegular22 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      22,
    ),
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular15 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      15,
    ),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsMedium15 = TextStyle(
    color: ColorConstant.whiteA700,
    fontSize: getFontSize(
      15,
    ),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );
}
