import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:safe_password/core/utils/get_storage_service.dart';
import 'package:safe_password/view/styles/app_theme.dart';

class SettingsController extends GetxController{
  SettingsController(this.getStorage);

  SettingsController get to=>Get.find();
  var selectedThemeMode= false.obs;

  var selectLocale = Locale("en","US").obs;
  var selectLanguage="".obs;
  var dropdownValue="English".obs;

  final List languageList = ['English','Turkish'];


  final GetStorage getStorage;

  void changeTheme(BuildContext context) {
    Get.changeTheme(Get.isDarkMode ? AppThemeData.lightTheme : AppThemeData.darkTheme);
    //ThemeSwitcher.of(context)!.changeTheme(theme: theme);
    if (getStorage.read("darkmode")) {
      getStorage.write("darkmode", false);
      selectedThemeMode.value = false;
    } else {
      getStorage.write("darkmode", true);
      selectedThemeMode.value = true;
    }

  }
  void changeAppLanguage(){
    if(selectLanguage.value=="English"){
      getStorage.write("locale", "en");
      selectLocale.value=Locale("en","US");
      Get.updateLocale(selectLocale.value);
    }else{
      getStorage.write("locale", "tr");
      selectLocale.value=Locale("tr","TR");
      Get.updateLocale(selectLocale.value);
    }

  }
  @override
  void onInit() {
    selectedThemeMode.value = getStorage.read("darkmode") ;
    if (getStorage.read("locale")=="en") {
      getStorage.write("locale", "en");
      selectLanguage.value = "English";
      dropdownValue.value= selectLanguage.value;
      selectLocale.value=Locale("en","US");
    } else {
      getStorage.write("locale", "tr");
      selectLanguage.value = "Turkish";
      dropdownValue.value= selectLanguage.value;
      selectLocale.value=Locale("tr","TR");
    }
  }
 void updateLanguage(){
    Get.updateLocale(selectLocale.value);

 }





}