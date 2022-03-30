import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:safe_password/core/utils/get_storage_service.dart';
import 'package:safe_password/model/account_info_list_model.dart';
import 'package:safe_password/model/account_info_model.dart';
import 'dart:convert' as convert;

class AccountInfoStorage extends GetxController{
  static AccountInfoStorage get to => Get.find();
  final GetLocalStorage? localStorages;
  AccountInfoStorage(this.localStorages);

  saveAccountList(AccountInfoListModel accountInfoListModel) async {
    try{
      await localStorages!.write("account",accountInfoListModel.toJson());
      print("account info model ${accountInfoListModel.toJson()}");
    }catch(error){
      print(error);
    }
  }

  Future<AccountInfoListModel> loadAccountInfoList(String key) async {
      Map<String,dynamic> responseData = await localStorages!.read(key) == null ?
      AccountInfoListModel(accountInfo: []).toJson():
      await localStorages!.read("account");
      return AccountInfoListModel.fromJson(responseData);
  }
  void deleteAccountItem(){
    localStorages!.remove("account");
  }

  removeData() async{
    await localStorages!.removeAll();
  }
}