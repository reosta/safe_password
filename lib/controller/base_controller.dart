import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:safe_password/core/storage/chane_theme_controller.dart';
import 'package:safe_password/core/utils/ads_helper.dart';
import 'package:safe_password/core/utils/hex_color_convert.dart';
import 'package:safe_password/model/account_info_model.dart';
import 'package:safe_password/view/styles/app_colors.dart';
import 'package:safe_password/view/styles/app_theme.dart';

class BaseController extends GetxController{
  BaseController get to=> Get.find();
  var pageIndex=0.obs;
  PageController pageController=PageController(initialPage: 0);

  BannerAd? bannerAd;
  var bannerAdLoaded=false.obs;


  List<AccountInfoModel> accounts = [];
  var pageName =<String>["Account Info","Create Password","Settings"];
  var headerButtonName =<String>["Account Info","Create Password","Settings"];

  var selectedButtonName="Account Info".obs;

  var selectList = List<bool>.generate(3, (index) => false);
  var tabButtonColors=<Color>[AppColors.appCat3,AppColors.appCat4,AppColors.appCat1,];
  var tabButtonIcon=<IconData>[FontAwesomeIcons.usersCog,FontAwesomeIcons.keyboard,FontAwesomeIcons.cogs];

  void changePage(int page){
    pageController.animateToPage(page, duration: Duration(milliseconds: 400), curve: Curves.easeInOutExpo);
  }

  void createBannerAds(){
    bannerAd=BannerAd(
      adUnitId: AdsHelper.bannerAds!,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (value){
          bannerAdLoaded.value=true;
          bannerAd!.load();
        },
        onAdFailedToLoad: (ad,error){
          print(error);
          ad.dispose();
        }
      )
    );
    bannerAd!.load();
  }


 @override
  void onInit() {
    createBannerAds();
    super.onInit();
  }

  @override
  void onClose() {
   bannerAd!.dispose();
    super.onClose();
  }



}