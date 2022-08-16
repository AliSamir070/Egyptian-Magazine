import 'package:shared_preferences/shared_preferences.dart';

class PrefsCacheHelper{
  static SharedPreferences? sharedPreferences;

  static init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putMode(bool isDark)async{
    return await sharedPreferences?.setBool('mode', isDark);
  }
  static bool getMode(){
    return sharedPreferences?.getBool('mode')??false;
  }
}