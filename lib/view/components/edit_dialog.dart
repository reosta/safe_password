import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:safe_password/controller/account_info_controller.dart';
import 'package:safe_password/core/storage/account_info_storage.dart';
import 'package:safe_password/view/styles/app_colors.dart';
import 'package:safe_password/view/styles/app_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class CreateAccountDialog extends GetView<AccountInfoController> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.orange),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        margin: EdgeInsets.all(6),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.all(5),
                      child: Text("Create Account".tr,style: TextStyle(fontFamily: "VarelaRound",fontSize: 18.sp),)),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.all(5),
                    alignment: AlignmentDirectional.topEnd,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                        child: Icon(Icons.close,size: 25,color: Colors.red,)),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(left: 2.w,top: 1.h,bottom: 1.h),
                  child: Text("Account Name".tr)),
              Container(
                  padding: EdgeInsets.only(bottom: 2.h,right: 2.w,left: 2.w),
                  child:
              TextField(
                controller: controller.accountNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: (value){
                  controller.accountInfoModel.accountName = value;
                },
              )),
              Container(
                  margin: EdgeInsets.only(left: 2.w,top: 1.h,bottom: 1.h),
                  child: Text("User Name or E-mail".tr)),
              Container(
                  padding: EdgeInsets.only(bottom: 2.h,right: 2.w,left: 2.w),
                  child:
              TextField(
                controller: controller.accountUserNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                ),
                onChanged: (value){
                  controller.accountInfoModel.accountUserName = value;
                },
              )),
              Container(
                  margin: EdgeInsets.only(left: 2.w,top: 1.h,bottom: 1.h),
                  child: Text("Password".tr,)),
              Container(
                  padding: EdgeInsets.only(bottom: 2.h,right: 2.w,left: 2.w),
                  child:
               Obx(()=> TextField(
               controller: controller.accountPasswordController,
               obscureText: controller.showPassword.value,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 suffixIcon: controller.showPassword.value?
                 InkWell(onTap: (){
                   controller.showPassword.value=false;
                 },
                     child:Icon(FontAwesomeIcons.eyeSlash,size: 20,) ):
                 InkWell(onTap: (){
                   controller.showPassword.value=true;
                 },
                     child: Icon(FontAwesomeIcons.eye,size: 20,)),
               ),
               onChanged: (value){
                 controller.accountInfoModel.accountPassword=value;
               },
             )),),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {
                  if(controller.accountUserNameController.text.isEmpty||controller.accountPasswordController.text.isEmpty||controller.accountNameController.text.isEmpty){
                    Get.snackbar("WARNING".tr, "Please Fill Empty Fields".tr,duration: Duration(seconds: 2),backgroundColor: AppColors.errorColor);
                  }else{
                    print("Burası save button ${controller.accountInfoListModel.accountInfo}");
                    controller.accountInfoListModel.accountInfo!.add(controller.accountInfoModel);
                    controller.addAccount(controller.accountInfoListModel);
                    print("Burası save button ${controller.accountInfoListModel.accountInfo}");
                    controller.accountNameController.clear();
                    controller.accountPasswordController.clear();
                    controller.accountUserNameController.clear();
                    Navigator.pop(context);
                  }
                }, child: Text("Save".tr,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
