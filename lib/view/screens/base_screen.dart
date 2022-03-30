import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:safe_password/controller/base_controller.dart';
import 'package:safe_password/core/routing/page_routing/account_info_page_routing.dart';
import 'package:safe_password/core/routing/page_routing/create_password_page_routing.dart';
import 'package:safe_password/core/routing/page_routing/settings_page_routing.dart';
import 'package:safe_password/core/storage/chane_theme_controller.dart';
import 'package:safe_password/view/components/page_button.dart';


import 'package:safe_password/view/styles/app_colors.dart';


class BaseScreen extends GetView<BaseController>{
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      bottomNavigationBar: Container(
        width: controller.bannerAd!.size.width.toDouble(),
        height: controller.bannerAd!.size.height.toDouble(),
        child: AdWidget(
          ad: controller.bannerAd!,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 22.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 2.h,),
                  Container(
                      padding: EdgeInsets.only(left: 4.w),
                      child: Obx(()=>Text(controller.pageName[controller.pageIndex.value].tr,style: TextStyle(fontSize: 20.sp,fontFamily: "VarelaRound"),))),
                  SizedBox(height: 1.h,),
                  Container(
                      width: double.infinity,
                      height: 13.h,
                      child: Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return Obx(()=>
                                CustomPageButton(
                                  decorationColor: AppColors.appColorAccent,
                                  buttonName:controller.headerButtonName[index].tr,
                                  selectButton: controller.selectedButtonName.value.tr==controller.headerButtonName[index].tr,
                                  icon: controller.tabButtonIcon[index],
                                  onTap: (){
                                    controller.changePage(index);
                                    controller.selectedButtonName.value = controller.headerButtonName[index].tr;
                                  },
                                ));
                          },itemCount: controller.headerButtonName.length,),
                      ))

                  /* category(
                          AppColors.appTxtTintDark_purple,"Account Info",Icon(Icons.person), (){
                        controller.changePage(0);
                      }),
                      category(AppColors.teal,"Create Password",Icon(Icons.create_new_folder_outlined), (){
                        controller.changePage(1);
                      }),
                      category(AppColors.darkSalmon,"Settings",Icon(Icons.settings), (){
                        controller.changePage(2);
                      }),*/
                ],
              ),
            ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                onPageChanged: (value){
                  controller.pageIndex.value = value;
                },
                children: [
                  AccountInfoPageRouting(),
                  CreatePasswordPageRouting(),
                  SettingsPageRouting(),
                ],
              ),
            ),
          ],
        ),
      ),
    ), onWillPop: () async {
        final shouldPopup = await showDialog(context: context, builder: (context) =>AlertDialog(
        title: Text("WARNING".tr,style: TextStyle(color: AppColors.appDarkRed,fontSize: 18.sp,fontWeight: FontWeight.bold),),
        content: Text("Are you sure you want to sign out?".tr),
        actions: [
          TextButton(onPressed: ()=>Navigator.of(context).pop(true), child: Text("YES".tr),),
          TextButton(onPressed: ()=>Navigator.of(context).pop(false), child: Text("NO".tr)),
        ],
      ));
      return shouldPopup ?? false;
    });
  }

}

/*SafeArea(
        child: Container(
          child:Stack(
            children: [
              Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 1.h,left: 6.w),
                          child: Text("Account Info Screen",style: AppStyle.baseScreenTitleText)),
                      Container(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                             Column(
                               children: [
                                 CircleAvatar(
                                     backgroundColor: HexColor("#006466"),
                                     radius: 30,
                                     child: Icon(Icons.password_rounded,color: Colors.white,)),
                                 SizedBox(height: 1.h,),
                                 Text("Account Info",style: AppStyle.navigateIconText)
                               ],
                             ),
                              Column(
                                children: [
                                  CircleAvatar(
                                      backgroundColor: HexColor("#065a60"),
                                      radius: 30,
                                      child: Icon(Icons.create_outlined,color: Colors.white,)),
                                  SizedBox(height: 1.h,),
                                  Text("Create Password",style: AppStyle.navigateIconText,)
                                ],
                              ),
                              InkWell(
                                onTap: (){},
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: HexColor("#0b525b"),
                                        radius: 30,
                                        child: Icon(Icons.settings,color: Colors.white,)),
                                    SizedBox(height: 1.h,),
                                    Text("Settings",style: AppStyle.navigateIconText)
                                  ],
                                ),
                              )
                            ],
                          ))
                    ],
                  )
              ),
              Container(
                padding: EdgeInsets.only(top: 20.h),
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                ) ,
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: (value){
                    controller.pageIndex.value = value;
                  },
                  children: [
                    AccountInfoPage(),
                    Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                        color: HexColor("#0b525b"),
                      ) ,

                    ),
                    Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                        color: HexColor("#065a60"),
                      ) ,

                    ),
                  ],
                )),
            ],
          ),
        ),
      )*/