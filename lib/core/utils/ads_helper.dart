import 'dart:io';

import 'package:flutter/services.dart';

class AdsHelper{

  static String? get interstitialAdUnitId{
    if(Platform.isAndroid){
      return "ca-app-pub-3940256099942544/1033173712";
    }else if(Platform.isIOS){
      return "ca-app-pub-9569384385624103/8107486541";
    }else{
      throw PlatformException(code: "unsopperted platform");
    }
  }

  static String? get bannerAds{
    if(Platform.isAndroid){
      return "ca-app-pub-3940256099942544/6300978111";
    }else if(Platform.isIOS){
      return "ca-app-pub-3940256099942544/2934735716";
    }else{
      throw PlatformException(code: "unsopperted platform");
    }
  }
}