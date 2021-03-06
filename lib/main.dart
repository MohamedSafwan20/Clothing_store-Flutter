import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gentleman/screens/cart.dart';
import 'package:gentleman/screens/home.dart';
import 'package:gentleman/screens/login.dart';
import 'package:gentleman/screens/my_orders.dart';
import 'package:gentleman/screens/order_details.dart';
import 'package:gentleman/screens/place_order.dart';
import 'package:gentleman/screens/product_details.dart';
import 'package:gentleman/screens/product_result.dart';
import 'package:gentleman/screens/reset_password.dart';
import 'package:gentleman/screens/search.dart';
import 'package:gentleman/screens/signup.dart';
import 'package:gentleman/screens/successful_order.dart';

void main() async {
  //Initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const Home(),
        "/signup": (context) => const Signup(),
        "/login": (context) => const Login(),
        "/search": (context) => const Search(),
        "/product-result": (context) => const ProductResult(),
        "/product-details": (context) => const ProductDetails(),
        "/cart": (context) => const Cart(),
        "/my-orders": (context) => const MyOrders(),
        "/order-details": (context) => const OrderDetails(),
        "/place-order": (context) => const PlaceOrder(),
        "/success-order": (context) => const SuccessfulOrder(),
        "/reset-password": (context) => const ResetPassword(),
      },
      initialRoute: "/login",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        indicatorColor: const Color(0xFF27D308),
        disabledColor: const Color(0xFFB5B5B5),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith(
          background: const Color(0xFFF0F0F0),
          primary: const Color(0xFF262525),
          secondary: const Color(0xffeaa53b),
          error: const Color(0xFFE21414),
        ),
      ),
    );
  }
}
