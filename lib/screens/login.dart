import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gentleman/widgets/regular_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
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
                            border: OutlineInputBorder(),
                            labelText: "Password"),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: RegularButton(
                        text: "Login",
                        onPressed: () {},
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "New User?",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Create Account",
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
      ),
    );
  }
}
