import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:safe_password/controller/intro_controller.dart';
import 'package:safe_password/view/screens/intro_pages/one_page.dart';
import 'package:safe_password/view/screens/intro_pages/three_page.dart';
import 'package:safe_password/view/screens/intro_pages/two_page.dart';
import 'package:safe_password/view/styles/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class IntroScreen extends GetView<IntroController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx(()=>Stack(
        children: [
          PageView.builder(
            controller: controller.introPageController,
            onPageChanged: (page){
              controller.pageIndex.value=page;
            },
            itemBuilder: (BuildContext context, int index) {
              return controller.pageList[index];
            },
            itemCount: controller.pageList.length,
          ),
          if(controller.pageIndex.value==2)...{
            Container(
              margin: EdgeInsets.only(bottom: 1.5.h),
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){
                    controller.viewIntro.value=true;
                    controller.checkViewIntro(controller.viewIntro.value);
                  }, child: Row(
                    children: [
                      Text("Finish".tr,style: TextStyle(fontSize: 20.sp,fontFamily: "VarelaRound"),),
                      Icon(CupertinoIcons.forward,size: 30,)
                    ],
                  ))
                ],
              ),
            )
          },
          Container(
            margin: EdgeInsets.only(bottom: 3.h),
            alignment: Alignment.bottomCenter,
            child: SmoothPageIndicator(
              controller: controller.introPageController,
              count: controller.pageList.length,
              effect: WormEffect(
                  dotColor: AppColors.darkOrange
              ),
            ),
          )
        ],
      )),
    );
  }

}
