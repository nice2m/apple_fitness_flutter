import 'package:get_storage/get_storage.dart';


final storageBox = GetStorage();

initStorage() async {
  await GetStorage.init();
}

getStorage(key) {
  return storageBox.read(key);
}

updateStorage(String key,value) {
  storageBox.write(key, value);
}

removeStorage(String key) {
  storageBox.remove(key);
}

