
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:safe_password/controller/base_controller.dart';
import 'package:safe_password/core/storage/account_info_storage.dart';
import 'package:safe_password/core/storage/chane_theme_controller.dart';
import 'package:safe_password/core/utils/get_storage_service.dart';


class BaseScreenBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() =>BaseController());
  }

}