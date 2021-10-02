import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gentleman/widgets/regular_button.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://image.freepik.com/free-vector/bow-tie-tuxedo-suit-gentleman-fashion-tailor-clothes-vintage-classic-logo-design_57043-572.jpg",
              fit: BoxFit.contain,
              height: 150,
              width: 150,
              alignment: Alignment.center,
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Phone number"),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "OTP"),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Password"),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Confirm Password"),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: RegularButton(
                      text: "Signup",
                      onPressed: () {},
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Existing User?",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
