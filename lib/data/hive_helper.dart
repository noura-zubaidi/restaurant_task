import 'package:hive/hive.dart';

class HiveHelper {
  Future<Box> openUserBox() async {
    return await Hive.openBox('users');
  }

  Future<Box> openLoginBox() async {
    return await Hive.openBox('login');
  }

  Future<Map<String, dynamic>?> getUserByPhone(String phone) async {
    final box = await openUserBox();
    return box.get(phone);
  }

  Future<void> saveUser(String phone, Map<String, dynamic> userData) async {
    final box = await openUserBox();
    await box.put(phone, userData);
  }

  Future<void> setRememberMe(String phone) async {
    final box = await openLoginBox();
    await box.put('phone', phone);
  }

  Future<String?> getRememberedUser() async {
    final box = await openLoginBox();
    return box.get('phone');
  }

  Future<void> clearRememberMe() async {
    final box = await openLoginBox();
    await box.delete('phone');
  }
}
