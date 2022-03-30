import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:safe_password/core/bindings/initial_bindings.dart';
import 'package:safe_password/core/routing/routing_page.dart';
import 'package:safe_password/core/storage/account_info_storage.dart';
import 'package:safe_password/core/utils/app_routers_name.dart';
import 'package:safe_password/view/screens/base_screen.dart';
import 'package:safe_password/view/styles/app_theme.dart';

import 'core/language/translation_language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //MobileAds.instance.initialize();
  await GetStorage.init();
  final readStorege = GetStorage();

  bool? isDarkMode = readStorege.read("darkmode") ?? false;
  readStorege.write("darkmode", isDarkMode);

  String? isLocale = readStorege.read("locale") ?? "en";
  readStorege.writeIfNull("locale", isLocale);

  runApp(MyApp(isDarkMode:isDarkMode,isLocale: isLocale,));
}

class MyApp extends StatelessWidget {
  final  isDarkMode;
  final  isLocale;

  const MyApp({Key? key, this.isDarkMode, this.isLocale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext , Orientation , ScreenType ) {
        return GetMaterialApp(
          translations: TranslationLanguage(),
          locale:  isLocale == "en" ? Locale('en','US'):Locale('tr','TR'),
          getPages: PageList.pages,
          initialBinding: InitialBinding(),
          debugShowCheckedModeBanner: false,
          theme: isDarkMode == false?AppThemeData.lightTheme:AppThemeData.darkTheme,
          darkTheme: AppThemeData.darkTheme,
          themeMode:  ThemeMode.system,
          initialRoute: AppRoutersName.initialRoute,
        );
      },
    );
  }
}


