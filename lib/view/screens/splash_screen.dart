import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:safe_password/controller/splash_controller.dart';
import 'package:safe_password/core/utils/app_routers_name.dart';
import 'package:safe_password/view/styles/app_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(controller.viewIntro.value){
      controller.navigateLogin();
    }else{
     controller.navigateIntro();
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width:25.w,child: Lottie.asset('assets/loading.json',)),
                SizedBox(height: 5.h,),
                AnimatedTextKit(
                  animatedTexts: [
                    FlickerAnimatedText("WELCOME TO SAFE PASSWORD".tr,textStyle: TextStyle(fontSize: 20.sp,fontFamily: "VarelaRound")),
                  ],
                  isRepeatingAnimation: true,
                ),
                //Text("".tr,style: TextStyle(fontSize: 20.sp,fontFamily: "VarelaRound"),textAlign: TextAlign.center,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
