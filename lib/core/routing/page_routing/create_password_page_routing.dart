import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_password/core/bindings/creat_password_page_bindings.dart';
import 'package:safe_password/core/utils/app_routers_name.dart';
import 'package:safe_password/view/screens/tab_pages/create_passwords.dart';
class CreatePasswordPageRouting extends StatelessWidget {
  const CreatePasswordPageRouting({Key? key}) : super(key: key);

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
        page:()=> CreatePasswords(),
        binding: CreatePasswordPageBindings(),
      );
    }
    throw Exception("Page Notfound");
  }
}
