import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:safe_password/core/utils/get_storage_service.dart';

class ChangeLanguageController extends GetxController{
  static ChangeLanguageController get to => Get.find();
  final GetLocalStorage getStorage;

  ChangeLanguageController(this.getStorage);

  var darkTheme = false.obs;



  void changeAppLanguage(String locale) async {
    await getStorage.write('locale', locale);
  }

  Future<bool> loadAppLanguage() async{
    var response =  await getStorage.read('locale');
    return response;
  }

  void deleteStorageTheme(){
    darkTheme.value = getStorage.remove('darkmode');
  }
}