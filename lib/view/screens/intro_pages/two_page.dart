import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 2.w,left: 2.w,top: 3.h),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(child: Lottie.asset('assets/twopage.json',)),
            SizedBox(height: 1.h,),
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText("Safe Password saves your passwords in your cache for your security.".tr,textAlign: TextAlign.center,
                  textStyle: TextStyle(fontSize: 20.sp,fontFamily: "VarelaRound"),),
                TypewriterAnimatedText("If you clear the cache of your application or delete the application from your device, your passwords will be inaccessible.".tr,textAlign: TextAlign.center,
                  textStyle: TextStyle(fontSize: 20.sp,fontFamily: "VarelaRound"),),
              ],
              isRepeatingAnimation: true,
            ),
          ],
        ),
      )

    );
  }
}