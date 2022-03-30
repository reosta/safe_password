import 'package:get/get.dart';
import 'package:safe_password/controller/account_info_controller.dart';
import 'package:safe_password/core/storage/account_info_storage.dart';
import 'package:safe_password/core/utils/get_storage_service.dart';

class AccountInfoPageBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AccountInfoController>(() =>AccountInfoController());
  }

}