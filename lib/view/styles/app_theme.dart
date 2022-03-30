import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safe_password/view/styles/app_colors.dart';


abstract class AppThemeData {

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldLightColor,
    primaryColor: AppColors.darkOrange,
    primaryColorDark: AppColors.darkOrange,
    errorColor: Colors.red,
    hoverColor: Colors.white54,
    dividerColor: AppColors.viewLineColor,
    appBarTheme: AppBarTheme(
      color: AppColors.appLayout_background,
      iconTheme: IconThemeData(color: AppColors.textPrimaryColor),
      brightness: Brightness.light,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
    colorScheme: ColorScheme.light(primary: AppColors.darkOrange, primaryVariant: AppColors.darkOrange),
    cardTheme: CardTheme(color: Colors.white),
    iconTheme: IconThemeData(color: AppColors.textPrimaryColor),
    primaryIconTheme: IconThemeData(color: AppColors.textPrimaryColor),
    accentIconTheme: IconThemeData(color: AppColors.textPrimaryColor),
    fontFamily: "VarelaRound",
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: AppColors.whiteColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor:AppColors.orange),
    textTheme: TextTheme(
      button: TextStyle(color:AppColors. appColorPrimary,),
      headline6: TextStyle(color: AppColors.textPrimaryColor),
      subtitle2: TextStyle(color: AppColors.textSecondaryColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.darkOrange)
        )
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,

  ).copyWith(
    pageTransitionsTheme: PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
  );

  static final ThemeData darkTheme = ThemeData(
    dialogTheme: DialogTheme(
      backgroundColor:  AppColors.appBackgroundColorDark,
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.appBackgroundColorDark,
    highlightColor: AppColors.appBackgroundColorDark,
    errorColor: Color(0xFFCF6676),
    appBarTheme: AppBarTheme(
      color: AppColors.appBackgroundColorDark,
      iconTheme: IconThemeData(color: AppColors.blackColor),
      brightness: Brightness.dark,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    ),
    primaryColor: AppColors.color_primary_black,
    accentColor: AppColors.whiteColor,
    dividerColor: Color(0xFFDADADA).withOpacity(0.3),
    primaryColorDark: AppColors.color_primary_black,
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
    hoverColor: Colors.black12,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: AppColors.appBackgroundColorDark),
    fontFamily: "VarelaRound",
    primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.white), overline: TextStyle(color: Colors.white),bodyText1: TextStyle(color: Colors.white),headline5:TextStyle(color: Colors.white),subtitle2: TextStyle(color: Colors.white) ),
    colorScheme: ColorScheme.dark(primary: AppColors.darkOrange, onPrimary: AppColors.cardBackgroundBlackDark, primaryVariant: AppColors.color_primary_black),
    cardTheme: CardTheme(color: AppColors.cardBackgroundBlackDark),
    iconTheme: IconThemeData(color: AppColors.whiteColor),
    primaryIconTheme: IconThemeData(color: AppColors.whiteColor),
    accentIconTheme: IconThemeData(color: AppColors.whiteColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: AppColors.darkOrange,hoverElevation: 12,foregroundColor: Colors.white),
    textTheme: TextTheme(
      button: TextStyle(color: AppColors.color_primary_black),
      headline6: TextStyle(color: AppColors.whiteColor,fontFamily: "VarelaRound"),
      subtitle2: TextStyle(color: Colors.white54,fontFamily: "VarelaRound"),
      overline: TextStyle(color: Colors.white,fontFamily: "VarelaRound"),
      bodyText1: TextStyle(color: Colors.white,fontFamily: "VarelaRound"),
      headline5:TextStyle(color: Colors.white,fontFamily: "VarelaRound"),
      bodyText2: TextStyle(color: Colors.white,fontFamily: "VarelaRound")
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.darkOrange)
      )
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ).copyWith(
    pageTransitionsTheme: PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
  );
}
