/// Will contain all_orders the textStyles that will be used in the theme or directly in the apps
import 'package:flutter/material.dart';

import 'color.dart';
import 'font.dart';

class AppStyle{
  static TextStyle kHeaderTextStyle = TextStyle(
    fontSize: 24,
    color: AppColor.primary,
    fontWeight: FontWeight.bold,
  );

  TextStyle kHeadline1TextStyle = const TextStyle(
    fontFamily: AppFont.heading,
    fontWeight: FontWeight.bold,
    color: AppColor.textPrimary,
    fontSize: 38,
  );

  TextStyle kHeadline2TextStyle = const TextStyle(
    fontFamily: AppFont.heading,
    fontWeight: FontWeight.bold,
    color: AppColor.textPrimary,
    fontSize: 26,
  );

  TextStyle kHeadline3TextStyle = const TextStyle(
    fontFamily: AppFont.heading,
    fontWeight: FontWeight.bold,
    color: AppColor.textPrimary,
    fontSize: 20,
  );

  TextStyle kHeadline4TextStyle = const TextStyle(
    fontFamily: AppFont.heading,
    fontWeight: FontWeight.normal,
    color: AppColor.textPrimary,
    fontSize: 16,
  );

  TextStyle kHeadline5TextStyle = const TextStyle(
    fontFamily: AppFont.body,
    fontWeight: FontWeight.bold,
    color: AppColor.textPrimary,
    fontSize: 38,
  );

  TextStyle kHeadline6TextStyle = const TextStyle(
    fontFamily: AppFont.body,
    fontWeight: FontWeight.normal,
    color: AppColor.textPrimary,
    fontSize: 26,
  );

  TextStyle kHeadline7TextStyle = const TextStyle(
    fontFamily: AppFont.body,
    fontWeight: FontWeight.w500,
    color: AppColor.textPrimary,
    fontSize: 16,
  );

  TextStyle kSubtitle1TextStyle = const TextStyle(
    fontFamily: AppFont.body,
    fontWeight: FontWeight.bold,
    color: AppColor.textPrimary,
    fontSize: 18,
  );

  TextStyle kSubtitle2TextStyle = const TextStyle(
    fontFamily: AppFont.heading,
    fontWeight: FontWeight.bold,
    color: AppColor.textPrimary,
    fontSize: 14,
  );

  TextStyle kBodyText1TextStyle = const TextStyle(
    fontFamily: AppFont.body,
    fontWeight: FontWeight.normal,
    color: AppColor.textPrimary,
    fontSize: 14,
  );

  TextStyle kBodyText2TextStyle = const TextStyle(
    fontFamily: AppFont.body,
    fontWeight: FontWeight.normal,
    color: AppColor.textPrimary,
    fontSize: 12,
  );

  TextStyle kCaptionTextStyle = const TextStyle(
    fontFamily: AppFont.heading,
    fontWeight: FontWeight.normal,
    color: AppColor.textPrimary,
    fontSize: 12,
  );

  /// This is the primary button Style
  TextStyle kButtonTextStyle = const TextStyle(
    fontFamily: AppFont.body,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 15,
  );
  /// This is the service price text Style
  TextStyle kServicePriceTextStyle =  TextStyle(
    fontFamily: AppFont.body,
    fontWeight: FontWeight.bold,
    color: AppColor.primary,
    fontSize: 15,
  );

  /// This is the service name text Style
  TextStyle kServiceNameTextStyle = const TextStyle(
    fontFamily: AppFont.heading,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 15,
  );

  TextStyle kAppBarTitleTextStyle = const TextStyle(
      fontFamily: AppFont.heading,
      fontWeight: FontWeight.w500,
      color: AppColor.textPrimary,
      fontSize: 19
  );

}