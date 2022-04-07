
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {

   Future<void> add(key, value) async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString(key, value);
   }

   Future<String?> get(key) async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      return sp.getString(key);
   }

   Future<void> remove(key) async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.remove(key);
   }

   Future<void> clear() async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.clear();
   }
}