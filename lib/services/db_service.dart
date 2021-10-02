import 'package:cloud_firestore/cloud_firestore.dart';

class DbService {
  static void test() {
    FirebaseFirestore.instance
        .collection("users")
        .doc("hello")
        .get()
        .then((value) => print(value.id))
        .catchError((err) => print(err));
  }

// static void signup() {
//   FirebaseFirestore.instance
//       .collection("users")
//       .add(data)
// }
}
