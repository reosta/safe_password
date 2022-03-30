import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
class OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2.w,left: 2.w,top: 3.h),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(child: Lottie.asset('assets/onepage.json',)),
            SizedBox(height: 2.h,),
            Container(
              child: Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText("In Safe Password no one but you can access your passwords.".tr,textAlign: TextAlign.center,
                      textStyle: TextStyle(fontSize: 20.sp,fontFamily: "VarelaRound"),),
                  ],
                  isRepeatingAnimation: false,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
