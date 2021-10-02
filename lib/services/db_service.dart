import 'package:firebase_auth/firebase_auth.dart';

class DbService {
  // static void test() {
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc("hello")
  //       .get()
  //       .then((value) => print(value.id))
  //       .catchError((err) => print(err));
  // }

  static Future<Map<String, dynamic>> signup(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user!.email!.isNotEmpty) {
        return {"success": true, "error": null};
      }
    } on FirebaseAuthException catch (e) {
      return {"success": false, "error": e.code};
    }
    return {"success": false, "error": "Server Error"};
  }

  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user!.email!.isNotEmpty) {
        return {"success": true, "error": null};
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "unknown")
        return {"success": false, "error": "Unknown error"};
      return {"success": false, "error": e.code};
    }
    return {"success": false, "error": "Server Error"};
  }
}
