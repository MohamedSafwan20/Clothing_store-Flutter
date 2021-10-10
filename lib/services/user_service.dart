import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static Future isUserAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("userId");
  }
}