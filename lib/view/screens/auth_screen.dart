import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:safe_password/controller/auth_controller.dart';
import 'package:safe_password/core/utils/app_state.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthScreen extends GetView<AuthController>{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body:SafeArea(
      child:Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 20.h,
                  bottom: 5.h
                ),
                  child: Text("Login To App".tr,style: TextStyle(fontSize: 25.sp),)),
              Lottie.asset('assets/auth.json'),
              SizedBox(height: 5.h,),
              ElevatedButton(onPressed: (){
                controller.authenticateWithBiometrics();
              }, child: Text("Continue with Fingerprint or Face or Pattern".tr,style: TextStyle(fontSize: 16.sp,fontFamily: "VarelaRound"),))
            ],
          ),
        ),
      ),
    ),);

  }
}