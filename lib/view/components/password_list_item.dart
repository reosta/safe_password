import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:safe_password/core/utils/hex_color_convert.dart';
import 'package:safe_password/view/styles/app_colors.dart';
import 'package:safe_password/view/styles/app_style.dart';
class PasswordListItem extends StatelessWidget {
  final String? accountName;
  final String? accountUserName;
  final String? accountPassword;
  final SlidableActionCallback? editButton;
  final SlidableActionCallback? deleteButton;
  final VoidCallback? showPwd;
  final VoidCallback? copiedPassword;
  final VoidCallback? copiedUserName;
  final bool? showPassword;
  const PasswordListItem({Key? key, this.accountName, this.accountUserName, this.accountPassword, this.editButton,this.deleteButton, this.showPwd, this.showPassword, this.copiedPassword, this.copiedUserName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2.w,right: 2.w,bottom: 2.h),
      child: Card(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)
          ),
          child: Slidable(
            key:  ValueKey(0),
            endActionPane:  ActionPane(
              motion:  ScrollMotion(),
              children: [
                /*SlidableAction(
                  flex: 1,
                  onPressed: editButton,
                  backgroundColor: AppColors.appDark_parrot_green,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),*/
                SlidableAction(
                  backgroundColor:AppColors.darkOrange,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete'.tr,
                  onPressed: deleteButton,
                ),
              ],
            ),
            child: Container(
              width: double.infinity,
              height: 12.h,
              margin: EdgeInsets.only(left: 2.w,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(accountName!,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,fontFamily: "VarelaRound"),),
                      SizedBox(height: 1.h,),
                      Text(accountUserName!,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.normal,fontFamily: "VarelaRound")),
                      SizedBox(height: 1.h,),
                      Text(showPassword!?accountPassword!.length>30?
                      "${accountPassword!.substring(0,30)}...":accountPassword!:accountPassword!.replaceAll(accountPassword!, "***************"),style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.normal,fontFamily: "VarelaRound")),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: (){
                          },
                          child:Container(
                            height: 2.h,
                          )),
                      SizedBox(height: 1.h,),
                      InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: copiedUserName,
                          child: Icon(FontAwesomeIcons.copy,size: 20,)),
                      SizedBox(height: 1.h,),
                      Row(
                        children: [
                          InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: showPwd,
                              child:showPassword!? Icon(FontAwesomeIcons.eye,size: 20,):Icon(FontAwesomeIcons.eyeSlash,size: 20,),
                          ),
                          SizedBox(width: 4.w,),
                          InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: copiedPassword,
                              child: Icon(FontAwesomeIcons.copy,size: 20,)
                          ),
                        ],
                      ),
                      SizedBox(height: 2.w,),
                    ],
                  ),
                  SizedBox(width: 4.w,),
                  Container(
                    width: 2.w,
                    height: 12.h,
                    color: AppColors.darkOrange,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
/*    Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 4.w,right: 4.w),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(accountName!,style: AppStyle.accountNameText),
              SizedBox(height: 0.5.h,),
              Text(accountUserName!,style: AppStyle.accountUserNameText),
              SizedBox(height: 0.5.h,),
              Text(accountPassword!,style: AppStyle.accountPasswordText),
            ],
          ),
        ),*/