import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:safe_password/core/utils/get_storage_service.dart';

class ChangeThemeController extends GetxController{
  static ChangeThemeController get to => Get.find();
  final GetLocalStorage getStorage;

  ChangeThemeController(this.getStorage);

  var darkTheme = false.obs;



  void changeAppTheme(bool themeValue) async {
    await getStorage.write('darkmode', themeValue);
  }

    Future<bool> loadAppTheme() async{
    var response =  await getStorage.read('darkmode');
    return response;
  }

  void deleteStorageTheme(){
    darkTheme.value = getStorage.remove('darkmode');
  }
}