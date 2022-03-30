import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:safe_password/controller/create_password_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:safe_password/view/styles/app_colors.dart';

class CreatePasswords extends GetView<CreatePasswordController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(()=> Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50.w,
                    child: CheckboxListTile(value: controller.selectUpperCase.value, onChanged: (value){
                      controller.selectUpperCase.value=value!;
                    },
                      title: Text("Upper Case".tr),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  Container(
                    width: 50.w,
                    child: CheckboxListTile(value: controller.selectLowerCase.value, onChanged: (value){
                      controller.selectLowerCase.value=value!;
                    },
                      title: Text("Lower Case".tr),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                ],
              )),
              Obx(()=> Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50.w,
                    child: CheckboxListTile(value: controller.selectNumber.value, onChanged: (value){
                      controller.selectNumber.value=value!;
                    },
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text("Number".tr),),
                  ),
                  Container(
                    width: 50.w,
                    child: CheckboxListTile(value: controller.selectSpecialCharacter.value, onChanged: (value){
                      controller.selectSpecialCharacter.value=value!;
                    },
                      title: Text("Special Character".tr),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                ],
              )),

              Container(
                  margin: EdgeInsets.only(left: 4.w,top: 2.h),
                  child: Text("Password Length".tr,)),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: controller.passwordSizeController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: (){
                    if(controller.passwordSizeController.text.isEmpty){
                      Get.snackbar("WARNING".tr, "Please Input Password Length".tr,duration: Duration(seconds: 2),backgroundColor: AppColors.errorColor);
                    }else{
                      controller.showInterstitialAd();
                      controller.generatePassword();
                    }
                  },
                  child: Text("Generate Password".tr,style: TextStyle(fontSize: 20.sp,fontFamily: "VarelaRound"),),
                ),
              ),
              Obx(()=>Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.darkOrange,
                    style: BorderStyle.solid,
                    width: 0.5,
                  )
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Container(
                      width: 80.w,
                        child: Text(controller.resultPassword.value,style: TextStyle(fontSize: 20.sp,),)),
                    Spacer(),
                    Column(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                            onTap: (){
                            if(controller.resultPassword.value.isNotEmpty){
                              controller.copyPassword(controller.resultPassword.value);
                            }
                            },
                            child: Icon(FontAwesomeIcons.copy)),
                        SizedBox(height: 2.h,),
                        InkWell(
                            borderRadius: BorderRadius.circular(20),
                          onTap: (){
                            controller.resultPassword.value="";
                          },
                            child: Icon(CupertinoIcons.delete)),
                      ],
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}