import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:safe_password/view/styles/app_colors.dart';
import 'package:safe_password/view/styles/app_theme.dart';

abstract class AppStyle{
  static TextStyle splashText = TextStyle(
    color: Colors.black,
  );
  static TextStyle accountNameText = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      fontFamily: 'VarelaRound'
  );
  static TextStyle accountUserNameText = TextStyle(
      fontSize: 16.sp,
      fontFamily: 'VarelaRound'
  );
  static TextStyle accountPasswordText = TextStyle(
      fontSize: 16.sp,
      fontFamily: 'VarelaRound'
  );
  static TextStyle baseScreenTitleText = TextStyle(
      fontSize: 20.sp,
      fontFamily: 'VarelaRound',
      fontWeight: FontWeight.bold,
  );
  static TextStyle navigateIconText = TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
    fontFamily: 'VarelaRound',
    fontWeight: FontWeight.bold,
  );

  static TextStyle editDialogTitle = TextStyle(
    color: Colors.black,
    fontSize: 15.sp,
    fontFamily: 'VarelaRound',
    fontWeight: FontWeight.bold,
  );

  static TextStyle emptyListText = TextStyle(
    color: Colors.black,
    fontSize: 18.sp,
    fontFamily: 'VarelaRound',
    fontWeight: FontWeight.bold,
  );



}