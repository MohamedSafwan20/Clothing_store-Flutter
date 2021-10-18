import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            "assets/images/logo.jpg",
            fit: BoxFit.contain,
            height: 70,
            width: 70,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/search");
              },
              icon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/my-orders");
              },
              icon: Icon(
                Icons.local_mall_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cart");
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                SharedPreferences.getInstance().then((value) {
                  value.remove("userId");
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login', (Route<dynamic> route) => false);
                });
              },
              icon: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
