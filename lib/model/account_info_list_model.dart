import 'package:safe_password/model/account_info_model.dart';

class AccountInfoListModel {
  List<AccountInfoModel>? accountInfo;

  AccountInfoListModel({this.accountInfo});

  AccountInfoListModel.fromJson(Map<String, dynamic> json) {
    if (json['account_info'] != null) {
      accountInfo = <AccountInfoModel>[];
      json['account_info'].forEach((v) {
        accountInfo!.add(new AccountInfoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.accountInfo != null) {
      data['account_info'] = this.accountInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  @override
  String toString() {
    return accountInfo.toString();
  }
}
