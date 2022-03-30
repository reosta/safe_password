import 'package:get/get.dart';
import 'package:safe_password/core/bindings/account_info_page_bindings.dart';
import 'package:safe_password/core/bindings/auth_screen_bindings.dart';
import 'package:safe_password/core/bindings/base_screen_bindings.dart';
import 'package:safe_password/core/bindings/creat_password_page_bindings.dart';
import 'package:safe_password/core/bindings/initial_bindings.dart';
import 'package:safe_password/core/bindings/intro_screen_bindings.dart';
import 'package:safe_password/core/bindings/settings_page_bindings.dart';
import 'package:safe_password/core/utils/app_routers_name.dart';
import 'package:safe_password/view/screens/auth_screen.dart';
import 'package:safe_password/view/screens/base_screen.dart';
import 'package:safe_password/view/screens/intro_screen.dart';
import 'package:safe_password/view/screens/splash_screen.dart';
import 'package:safe_password/view/screens/tab_pages/account_info_page.dart';
import 'package:safe_password/view/screens/tab_pages/create_passwords.dart';
import 'package:safe_password/view/screens/tab_pages/settings.dart';

class PageList{
  static List<GetPage> pages=[
    GetPage(name: AppRoutersName.initialRoute, page: ()=> SplashScreen(), binding: InitialBinding()),
    GetPage(name: AppRoutersName.authPage, page: ()=>AuthScreen(),binding: AuthScreenBinding()),
    GetPage(name: AppRoutersName.basePage, page: ()=>BaseScreen(),binding: BaseScreenBindings()),
    GetPage(name: AppRoutersName.accountInfoPage, page: ()=>AccountInfoPage(),binding: AccountInfoPageBindings()),
    GetPage(name: AppRoutersName.createPasswordsPage, page: ()=>CreatePasswords(),binding: CreatePasswordPageBindings()),
    GetPage(name: AppRoutersName.settingsPage, page: ()=>SettingsPage(),binding: SettingsPageBindings()),
    GetPage(name: AppRoutersName.introPage, page: ()=>IntroScreen(),binding: IntroScreenBindings()),
   //GetPage(name: AppRoutersName.homePage, page: ()=>BaseScreen()),
  ];
}