import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static Future isUserAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("userId");
  }

  static String getCurrentUserId() {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    return userId;
  }

  static Future resetPassword(String email) {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
