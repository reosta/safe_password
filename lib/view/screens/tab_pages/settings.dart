import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:safe_password/controller/create_password_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:safe_password/controller/settings_controller.dart';
import 'package:safe_password/core/storage/chane_theme_controller.dart';
import 'package:safe_password/view/styles/app_colors.dart';

class SettingsPage extends GetView<SettingsController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:                   Container(
        decoration:BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
        ) ,
        child: Column(
          children: [
            Obx(()=>ListTile(
              title: Text("Dark Mode".tr),
              trailing: controller.selectedThemeMode.value
                  ? Icon(CupertinoIcons.brightness)
                  : Icon(CupertinoIcons.moon_stars,
              ),
              onTap: (){
                controller.changeTheme(context);
              },
            )),
            Container(
              width: double.infinity,
              height: 10.h,
              margin: EdgeInsets.only(left: 3.w,right: 4.w),
              padding: EdgeInsets.all(5),
              child: DropdownButton(
                elevation: 4,
                  underline: Divider(height: 1.h,color: AppColors.darkOrange,),
                  icon: Icon(FontAwesomeIcons.angleDown),
                  isExpanded: true,
                  value: controller.dropdownValue.value,
                  onChanged: (value){
                    controller.dropdownValue.value=value.toString();
                  },
                  items: controller.languageList.map((element) =>
                      DropdownMenuItem(
                        value: element,
                        child: Text(element),onTap: (){
                        controller.selectLanguage.value = element;
                        controller.changeAppLanguage();
                      },)).toList())),
          ],
        ),
      ),
    );
  }


}