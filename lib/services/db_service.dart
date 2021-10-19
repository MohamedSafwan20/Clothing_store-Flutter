import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class DbService {
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
      if (e.code == "unknown") {
        return {"success": false, "error": "Unknown error"};
      }
      return {"success": false, "error": e.code};
    }
    return {"success": false, "error": "Server Error"};
  }

  static Future getLatestProducts() async {
    QuerySnapshot res = await FirebaseFirestore.instance
        .collection("products")
        .orderBy("created_at", descending: true)
        .get();

    return res.docs;
  }

  static Future getLowestPriceProducts() async {
    QuerySnapshot res = await FirebaseFirestore.instance
        .collection("products")
        .orderBy("product_price")
        .get();

    return res.docs;
  }

  static Future getProductsByCategory(String category) async {
    QuerySnapshot res = await FirebaseFirestore.instance
        .collection("products")
        .where("product_category", isEqualTo: category)
        .get();

    return res.docs;
  }

  static Future getProductDetails(String id) async {
    DocumentSnapshot<Map<String, dynamic>> res =
        await FirebaseFirestore.instance.collection("products").doc(id).get();

    return res.data();
  }

  static Future getSearchKeywords() async {
    QuerySnapshot<Map<String, dynamic>> res =
        await FirebaseFirestore.instance.collection("products").get();

    return res.docs;
  }

  static Future getProductResults(String productName) async {
    String capitalizedProductName =
        productName.replaceFirst(productName[0], productName[0].toUpperCase());

    QuerySnapshot<Map<String, dynamic>> res = await FirebaseFirestore.instance
        .collection("products")
        .where("product_name", isGreaterThanOrEqualTo: capitalizedProductName)
        .where("product_name",
            isLessThanOrEqualTo: capitalizedProductName + '\uf8ff')
        .get();
    return res.docs;
  }

  static Future addToCart(String userId, String productId) async {
    try {
      await FirebaseFirestore.instance.collection("cart").doc(userId).set({
        "products": FieldValue.arrayUnion(
            [FirebaseFirestore.instance.doc("/products/$productId")])
      }, SetOptions(merge: true));

      return true;
    } catch (_) {
      return false;
    }
  }

  static Future getCartItems(String userId) async {
    DocumentSnapshot<Map<String, dynamic>> res =
        await FirebaseFirestore.instance.collection("cart").doc(userId).get();

    if (res.data() == null) {
      return {"products": []};
    }

    return res.data();
  }

  static Future getRefData(DocumentReference ref) async {
    DocumentSnapshot<Object?> res = await ref.get();

    return res.data();
  }

  static Future deleteFromCart(String userId, String productId) async {
    try {
      await FirebaseFirestore.instance.collection("cart").doc(userId).update({
        "products": FieldValue.arrayRemove(
            [FirebaseFirestore.instance.doc("/products/$productId")])
      });

      return true;
    } catch (_) {
      return false;
    }
  }

  static Future addOrder(
      String userId,
      String buyerAddress,
      String buyerName,
      String buyerPhone,
      String paymentMode,
      String productId,
      String productSize) async {
    try {
      await FirebaseFirestore.instance.collection("orders").doc(userId).set({
        "products": FieldValue.arrayUnion([
          {
            "buyer_address": buyerAddress,
            "buyer_name": buyerName,
            "buyer_phone": buyerPhone,
            "payment_method": paymentMode,
            "product_id":
                FirebaseFirestore.instance.doc("/products/$productId"),
            "product_size": productSize,
            "status": "PICKED UP",
            "order_no": const Uuid().v1(),
            "created_at": DateTime.now(),
          }
        ])
      }, SetOptions(merge: true));

      return true;
    } catch (_) {
      return false;
    }
  }

  static Future getAllUserOrders(String userId) async {
    DocumentSnapshot res =
        await FirebaseFirestore.instance.collection("orders").doc(userId).get();

    return res.data();
  }

  static Future deleteOrder(String userId, Map productData) async {
    try {
      await FirebaseFirestore.instance.collection("orders").doc(userId).update({
        "products": FieldValue.arrayRemove([productData])
      });

      return true;
    } catch (_) {
      return false;
    }
  }
}
