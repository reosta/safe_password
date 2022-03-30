import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:safe_password/view/styles/app_colors.dart';
class CustomPageButton extends StatelessWidget {
  const CustomPageButton({Key? key, this.onTap, this.decorationColor, this.selectButton, this.icon, this.buttonName}) : super(key: key);
  final VoidCallback? onTap;
  final Color? decorationColor;
  final bool? selectButton;
  final IconData? icon;
  final String? buttonName;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: selectButton == true? AppColors.darkOrange: decorationColor,
      child: Semantics(
        selected: selectButton,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: onTap,
          child: Container(
            width: 30.w,
            height: 13.h,
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Icon(icon),
                SizedBox(height:2.h,),
                Text('$buttonName', maxLines: 2, textAlign: TextAlign.center,style: TextStyle(fontFamily: "VarelaRound",fontSize: 16.sp),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
