import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:safe_password/core/utils/ads_helper.dart';
import 'package:safe_password/view/styles/app_colors.dart';

class CreatePasswordController extends GetxController{
  CreatePasswordController get to=>Get.find();

  var selectSpecialCharacter=false.obs;
  var selectUpperCase=false.obs;
  var selectLowerCase=false.obs;
  var selectNumber=false.obs;

  var upperCase="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  var lowerCase="abcdefghıjklmopqrstuvwxyz";
  var number="0123456789";
  var specialCharacter="@#=+*./()%&?{}[]!:;,-_₺€";
  var passwordLength=6.obs;

  var resultPassword="".obs;

  var chars=''.obs;

  InterstitialAd? interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  String testDevice = 'YOUR_DEVICE_ID';
  int maxFailedLoadAttempts = 3;

  TextEditingController passwordSizeController=TextEditingController();


  /*void generatePassword(){
    if(selectUpperCase.value){
      chars+="$upperCase";
    }else if(selectLowerCase.value){
      chars+="$upperCase";
    }
    creatingPassword.value = List.generate(passwordSizeController.text.length, (index){
      final indexRandom=Random().nextInt(chars.length);
    }).join("");

  }*/

  @override
  void onInit() {
    createInterstitialAd();
    super.onInit();
  }
  void generatePassword() {
    if (selectSpecialCharacter.value == false &&
        selectUpperCase.value == false &&
        selectLowerCase.value == false &&
        selectNumber.value == false) {
      selectSpecialCharacter.value = true;
    }
    chars.value += (selectLowerCase.value ? lowerCase : '');
    chars.value += (selectUpperCase.value ? upperCase : '');
    chars.value += (selectNumber.value ? number : '');
    chars.value += (selectSpecialCharacter.value ? specialCharacter : '');

    int i = 0;
    String _result = "";
    while (i < int.parse(passwordSizeController.text).round()) {
      int randomInt = Random.secure().nextInt(chars.value.length);
      resultPassword.value += chars.value[randomInt];
      i++;
    }
  }

  Future<void> copyPassword(String password) async {
    await Clipboard.setData(ClipboardData(text:password));
    Get.snackbar("Successful".tr, "Password Copied to Clipboard".tr,duration: Duration(seconds: 2),backgroundColor: AppColors.limeGreen);
  }

  void createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdsHelper.interstitialAdUnitId!,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
            _numInterstitialLoadAttempts += 1;
            interstitialAd = null;
            if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
              createInterstitialAd();
            }
          },
        ));
  }


  void showInterstitialAd() {
    if (interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createInterstitialAd();
      },
    );
    interstitialAd!.show();
    interstitialAd = null;
  }
}