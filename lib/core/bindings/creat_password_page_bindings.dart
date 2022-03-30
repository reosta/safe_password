import 'package:get/get.dart';
import 'package:safe_password/controller/account_info_controller.dart';
import 'package:safe_password/controller/create_password_controller.dart';

class CreatePasswordPageBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CreatePasswordController>(() =>CreatePasswordController());
  }

}