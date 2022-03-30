import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:safe_password/controller/account_info_controller.dart';
import 'package:safe_password/core/storage/account_info_storage.dart';
import 'package:safe_password/view/components/edit_dialog.dart';
import 'package:safe_password/view/components/password_list_item.dart';


class AccountInfoPage extends GetView<AccountInfoController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        child: Obx(()=>Visibility(
          visible:controller.visibleAddButton.value,
          child: FloatingActionButton(
              onPressed: () {
                //controller.loadAds();
                controller.showInterstitialAd();
                showDialog(context: context, builder: (context){
                  return CreateAccountDialog();
                });
              },
              child:  Icon(Icons.add)),
        )),
      ),
      body:  Obx(()=>
      controller.accountInfoList.isEmpty?
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Nothing has been added to the list yet".tr,style: TextStyle(fontSize: 18.sp,fontFamily: "VarelaRound"),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Click The (+) Button To Add".tr,style: TextStyle(fontSize: 18.sp,fontFamily: "VarelaRound"),),
            ],
          )
        ],
      ):
      ListView.builder(
        controller: controller.scrollController,
        itemBuilder:(context,index){
          return  Obx(()=>PasswordListItem(
            accountName: controller.accountInfoList[index].accountName,
            accountUserName: controller.accountInfoList[index].accountUserName,
            accountPassword:  controller.accountInfoList[index].accountPassword,
            copiedPassword: (){
              controller.copyPassword(controller.accountInfoList[index].accountPassword!);
            },
            copiedUserName: (){
              controller.copyUserName(controller.accountInfoList[index].accountUserName!);
            },
            deleteButton: (context){
              controller.deleteAccount(index);
            },
            showPassword: controller.show[index],
            showPwd: (){

              controller.show[index]=controller.show[index]?false:true;
            },));
        },itemCount: controller.accountInfoList.length,),
      ));
  }

}
/*import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:safe_password/controller/account_info_controller.dart';
import 'package:safe_password/core/utils/hex_color_convert.dart';
import 'package:safe_password/view/components/password_list_item.dart';

class AccountInfoPage extends GetView<AccountInfoController>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
        color: HexColor("#144552"),
      ),
      child: Stack(
        children: [
          ListView.builder(itemBuilder: (context,index){
            return PasswordListItem();
          },
          ),
          Container(
            margin: EdgeInsets.all(15),
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              backgroundColor: HexColor("#4d194d"),
              radius: 30,
              foregroundColor: Colors.white,
              child: IconButton( icon: Icon(Icons.add,size: 30,color:Colors.white), onPressed: () {  },),
            ),
          )
        ],
      ),
    );
  }

}*/