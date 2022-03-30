import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:safe_password/core/utils/app_routers_name.dart';
import 'package:safe_password/core/utils/app_state.dart';

class AuthController extends GetxController{
  AuthController get to=> Get.find();

  var canCheckBiometrics = false.obs;
  var availableBiometrics=<BiometricType>[].obs;
  var authorized = 'Not Authorized'.obs;
  var isAuthenticating = false.obs;
  var hasFingerPrint= false.obs;
  var hasFaceId= false.obs;
  var supportedState=Rx<SupportState>(SupportState.UNKNOW);
  var authenticated=false.obs;


  LocalAuthentication? localAuthentication =LocalAuthentication();


  @override
  void onInit() {
    checkBiometrics();
    /*localAuthentication!.isDeviceSupported().then((isSupported) {
    if(isSupported){
      supportedState.value = SupportState.SUPPORTED;

    }else {
      supportedState.value=SupportState.UNSUPPORTED;
    }
  });*/

    super.onInit();
  }

  Future<void> checkBiometrics() async {
    try {
      canCheckBiometrics.value = await localAuthentication!.canCheckBiometrics;
      if(canCheckBiometrics.value){
        getAvailableBiometrics();
      }
    } on PlatformException catch (e) {
      print("error biometrics $e");
      Get.snackbar("Error", "Device Not Suported");
      canCheckBiometrics.value = false;
      print(e);
    }
  }

  Future<void> getAvailableBiometrics() async {
    try {
      availableBiometrics.value = await localAuthentication!.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics.value = <BiometricType>[];
      print(e);
    }
  }


  Future<void> authenticateWithBiometrics() async {
    var iosStrings = const IOSAuthMessages(
      cancelButton: 'cancel',
      goToSettingsButton: 'settings',
      goToSettingsDescription: 'Please set up your Touch ID or Face ID.',
      lockOut: 'Please reenable your Touch ID',);
    var  androidString = const AndroidAuthMessages(
        cancelButton: 'cancel',
        goToSettingsButton: 'settings',
        goToSettingsDescription: 'Please set up your Finger Print or Pattern or Face.',
        biometricNotRecognized: "Please reenable your Finger Print ID");
    try {
      isAuthenticating.value = true;
      authorized.value= 'Authenticating';
       authenticated.value = await localAuthentication!.authenticate(
        localizedReason:
        'Scan your Fingerprint or Face or Pattern'.tr,
        useErrorDialogs: true,
        stickyAuth: true,
        biometricOnly: false,);
      isAuthenticating.value = false;
      authorized.value = 'Authenticating';
      if(authenticated.value==true){
        Get.offNamed(AppRoutersName.basePage);
      }
    } on PlatformException catch (e) {
      print(e);
      isAuthenticating.value = false;
      Get.snackbar("Error", "${e.message}");
      authorized.value = "Error - ${e.message}";
    }
  }


}
