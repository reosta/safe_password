import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:safe_password/controller/account_info_controller.dart';
import 'package:safe_password/controller/create_password_controller.dart';
import 'package:safe_password/controller/settings_controller.dart';
import 'package:safe_password/core/utils/get_storage_service.dart';

class SettingsPageBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() =>SettingsController(Get.find<GetStorage>()));
    Get.lazyPut<GetStorage>(() =>GetStorage());
  }

}