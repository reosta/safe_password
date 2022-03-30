import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_password/core/bindings/account_info_page_bindings.dart';
import 'package:safe_password/core/utils/app_routers_name.dart';
import 'package:safe_password/view/screens/tab_pages/account_info_page.dart';
class AccountInfoPageRouting extends StatelessWidget {
  const AccountInfoPageRouting({Key? key}) : super(key: key);

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
        page:()=> AccountInfoPage(),
        binding: AccountInfoPageBindings(),
      );
    }
    throw Exception("Page Notfound");
  }
}
