import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
class ThreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2.w,left: 2.w,top: 3.h),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(child: Lottie.asset('assets/threepage.json',)),
            SizedBox(height: 2.h,),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText("If you are ready, you can start to protect your passwords security...".tr,textAlign: TextAlign.center,
                    textStyle: TextStyle(fontSize: 20.sp,fontFamily: "VarelaRound")),
              ],
              isRepeatingAnimation: false,
            ),
          ],
        ),
      ),
    );
  }
}