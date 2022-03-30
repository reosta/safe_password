import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_password/core/bindings/settings_page_bindings.dart';
import 'package:safe_password/core/utils/app_routers_name.dart';
import 'package:safe_password/view/screens/tab_pages/settings.dart';
class SettingsPageRouting extends StatelessWidget {
  const SettingsPageRouting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: AppRoutersName.initialRoute,
      onGenerateRoute: onGenerateRouter,
    );
  }

  static Route onGenerateRouter(RouteSettings settings){
    if(settings.name==AppRoutersName.initialRoute){
      return GetPageRoute(
        settings: settings,
        page:()=> SettingsPage(),
        binding: SettingsPageBindings(),
      );
    }
    throw Exception("Page Notfound");
  }
}
