import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DbService {
  static Future<Map<String, dynamic>> signup(String email, String password) async {
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

  static Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user!.email!.isNotEmpty) {
        return {"success": true, "error": null};
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "unknown") {
        return {"success": false, "error": "Unknown error"};
      }
      return {"success": false, "error": e.code};
    }
    return {"success": false, "error": "Server Error"};
  }

  static Future getAllProducts() async {
    QuerySnapshot res =
        await FirebaseFirestore.instance.collection("products").get();

    return res.docs;
  }
}
