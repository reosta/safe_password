import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:safe_password/core/utils/app_routers_name.dart';

class SplashController extends GetxController{


  static SplashController get to =>Get.find();

  var getStorage = GetStorage();

  var viewIntro = false.obs;


  @override
  void onInit() {
    viewIntro.value = getStorage.read("viewIntro") ?? false;
    super.onInit();
  }
  void navigateLogin() async {
    await Future.delayed(Duration(milliseconds: 4000),(){
      Get.offNamed(AppRoutersName.authPage);
    });
  }

  void navigateIntro() async {
    await Future.delayed(Duration(milliseconds: 4000),(){
      Get.offNamed(AppRoutersName.introPage);
    });
  }
}