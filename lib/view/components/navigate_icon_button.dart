import 'package:flutter/material.dart';
import 'package:safe_password/view/styles/app_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class NavigateIconButton extends StatelessWidget {
  final VoidCallback? passwordsButton;
  final VoidCallback? createPasswordsButton;
  final VoidCallback? settingsButton;
  const NavigateIconButton({Key? key, this.passwordsButton, this.createPasswordsButton, this.settingsButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
        padding: EdgeInsets.only(top: 1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.deepPurple[800],
                    radius: 30,
                    child: Icon(Icons.lock,color: Colors.white,)),
                SizedBox(height: 1.h,),
                Text("ŞİFRELERİM",style: AppStyle.navigateIconText)
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.deepOrange,
                    radius: 30,
                    child: Icon(Icons.create_outlined,color: Colors.white,)),
                SizedBox(height: 1.h,),
                Text("ŞİFRE OLUŞTUR",style: AppStyle.navigateIconText,)
              ],
            ),
            InkWell(
              onTap: settingsButton,
              child: Column(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.amber[800],
                      radius: 30,
                      child: Icon(Icons.settings,color: Colors.white,)),
                  SizedBox(height: 1.h,),
                  Text("AYARLAR",style: AppStyle.navigateIconText)
                ],
              ),
            )
          ],
        ));
  }
}
