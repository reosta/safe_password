import 'package:get_storage/get_storage.dart';
import 'dart:convert' as convert;

abstract class GetLocalStorage {
  write(String key, dynamic json);
  read<S>(String key, {S Function(Map) construct});
  writeStr(String key, String value);
  readStr(String key, String value);
  remove(String key);
  removeAll();
}

class GetLocalStorageImpl implements GetLocalStorage {
   GetStorage? storage;

  GetLocalStorageImpl() {
    _init();
  }

  _init() {
    storage = GetStorage();
  }

  @override
  write(String key, dynamic value) {
    storage!.write(key, convert.jsonEncode(value));
  }

  @override
  read<S>(String key, {S Function(Map)? construct}) {
    String? value = storage!.read(key);

    if (value==null) {
      return;
    }

    if (construct == null) return convert.jsonDecode(value);
    Map<String, dynamic> json = convert.jsonDecode(value);
    return construct(json);
  }

  @override
  remove(String key) {
    storage!.remove(key);
  }

  @override
  removeAll() {
    storage!.erase();
  }

  @override
  readStr(String key, String value) {
    throw UnimplementedError();
  }

  @override
  writeStr(String key, String value) {
    throw UnimplementedError();
  }
}