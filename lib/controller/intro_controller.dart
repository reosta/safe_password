import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:safe_password/core/utils/app_routers_name.dart';
import 'package:safe_password/view/screens/intro_pages/one_page.dart';
import 'package:safe_password/view/screens/intro_pages/three_page.dart';
import 'package:safe_password/view/screens/intro_pages/two_page.dart';

class IntroController extends GetxController{
  PageController introPageController = PageController();
  GetStorage getStorage=GetStorage();

  var viewIntro = false.obs;
  var pageIndex = 0.obs;

  List<Widget> pageList=[
    OnePage(),
    TwoPage(),
    ThreePage(),];

  @override
  void onInit() {
    super.onInit();
  }

  void checkViewIntro(bool viewIntro){
    getStorage.write("viewIntro", viewIntro);
    Get.offNamed(AppRoutersName.authPage);
  }

}