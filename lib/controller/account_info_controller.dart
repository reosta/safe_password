import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:safe_password/core/storage/account_info_storage.dart';
import 'package:safe_password/core/utils/ads_helper.dart';
import 'package:safe_password/core/utils/app_state.dart';
import 'package:safe_password/model/account_info_list_model.dart';
import 'package:safe_password/model/account_info_model.dart';
import 'package:safe_password/view/styles/app_colors.dart';

class AccountInfoController extends GetxController{
  AccountInfoController get to=> Get.find();


  InterstitialAd? interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  String testDevice = 'YOUR_DEVICE_ID';
  int maxFailedLoadAttempts = 3;

  var accountInfoList = <AccountInfoModel>[].obs;

  AccountInfoModel accountInfoModel = AccountInfoModel();
  AccountInfoListModel accountInfoListModel=AccountInfoListModel();
  var visibleAddButton =true.obs;
  var appState=Rx<AppStates>(AppStates.WAITING);
  ScrollController scrollController=ScrollController();

  var showPassword=true.obs;

  TextEditingController accountNameController=TextEditingController();
  TextEditingController accountUserNameController=TextEditingController();
  TextEditingController accountPasswordController=TextEditingController();

  void hideAddButton(){
   visibleAddButton.value=false;
  }

  void showAddButton(){
    visibleAddButton.value=true;
  }

  void handleAddButton(){
    scrollController.addListener(() {
      if(scrollController.position.userScrollDirection==ScrollDirection.reverse){
        hideAddButton();
      }
      if(scrollController.position.userScrollDirection==ScrollDirection.forward){
        showAddButton();
      }
    });
  }

   var show=<bool>[].obs;

  @override
  void onInit() {
    createInterstitialAd();
    //accountInfoListModel.accountInfo=[];
    getAccountInfoList();
    handleAddButton();
    super.onInit();
  }

  void addAccount(AccountInfoListModel accountInfoListModel) async {
    await AccountInfoStorage.to.saveAccountList(accountInfoListModel);
    getAccountInfoList();
  }

  void deleteAccount(int index) {
     accountInfoListModel.accountInfo!.removeAt(index);
     addAccount(accountInfoListModel);
  }

 void getAccountInfoList() async {
    try{
      appState.value=AppStates.LOADING;
      final response = await AccountInfoStorage.to.loadAccountInfoList("account").then((value) {
        accountInfoListModel = value;
        accountInfoList.value = value.accountInfo!;
        print("Burası getAccount ınfo ${accountInfoListModel.toJson()}");
        show.value=List<bool>.generate(accountInfoList.value.length, (index) => false);
      });
        appState.value=AppStates.DONE;
    }catch(e){
      print(e);
      appState.value=AppStates.ERROR;
    }
  }

  Future<void> copyPassword(String password) async {
    await Clipboard.setData(ClipboardData(text:password));
    Get.snackbar("Successful".tr, "Password Copied to Clipboard".tr,duration: Duration(seconds: 2),backgroundColor: AppColors.limeGreen);
  }
  Future<void> copyUserName(String userName) async {
    await Clipboard.setData(ClipboardData(text:userName));
    Get.snackbar("Successful".tr, "User Name Copied to Clipboard".tr,duration: Duration(seconds: 2),backgroundColor: AppColors.limeGreen);
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

  /*void loadAds() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-9569384385624103/7932867358',
        request: AdRequest(),

        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            this.myIntersAds = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }*/


}