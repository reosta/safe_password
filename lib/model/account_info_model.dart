class AccountInfoModel {
  String? accountName;
  String? accountUserName;
  String? accountPassword;

  AccountInfoModel(
      {this.accountName, this.accountUserName,
        this.accountPassword,
      });

  AccountInfoModel.fromJson(Map<String, dynamic> json) {
    accountName = json['accountName'];
    accountUserName = json['accountUserName'];
    accountPassword = json['accountPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountName'] = this.accountName;
    data['accountUserName'] = this.accountUserName;
    data['accountPassword'] = this.accountPassword;
    return data;
  }


}