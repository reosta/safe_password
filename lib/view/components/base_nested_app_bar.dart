import 'package:flutter/material.dart';
import 'package:safe_password/view/styles/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:safe_password/view/styles/app_style.dart';

class BaseNestedAppBar extends StatelessWidget {
  final bool? innerBoxIsScrolled;
  const BaseNestedAppBar({Key? key, this.innerBoxIsScrolled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      pinned: false,
      floating: true,
      automaticallyImplyLeading: false,
      title: Text("Safe Password",style: TextStyle(fontSize: 20.sp),),
      bottom: PreferredSize(
        preferredSize: Size(double.maxFinite, 15.h), child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              category(AppColors.appCat3,"Account Info",Icon(Icons.person),onTap: (){}),
              category(AppColors.appCat4,"Create Password",Icon(Icons.create_new_folder_outlined), onTap: (){}),
              category(AppColors.appCat5,"Settings",Icon(Icons.settings), onTap: (){}),
            ],
          )

        ],
      ),
      ),
    );
  }

  Widget category(Color color,  String? name, Icon icon,{ required Function onTap}) {
    return Container(
      width: 30.w,
      height: 13.h,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon,
          SizedBox(height:2.h,),
          Text('$name', maxLines: 2, textAlign: TextAlign.center),
        ],
      ),
    );
  }

}
