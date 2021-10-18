import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/services/user_service.dart';
import 'package:gentleman/widgets/regular_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  String error = "";

  @override
  void initState() {
    UserService.isUserAuthenticated().then((value) {
      if (value != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });

    super.initState();
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      DbService.login(_emailController.text, _passwordController.text)
          .then((value) => {
                if (value["success"])
                  {
                    SharedPreferences.getInstance().then((value) {
                      value.setString(
                          "userId", FirebaseAuth.instance.currentUser!.uid);
                      setState(() {
                        _isLoading = false;
                      });
                      Navigator.pushReplacementNamed(context, "/");
                    })
                  }
                else
          {
            setState(() {
              error = value["error"];
              _isLoading = false;
            })
          }
      });
    }
  }

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
              Image.asset(
                "assets/images/logo.jpg",
                fit: BoxFit.contain,
                height: 150,
                width: 150,
                alignment: Alignment.center,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    error.isNotEmpty
                        ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: (Text(
                        error,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )),
                    )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: FractionallySizedBox(
                        widthFactor: 0.8,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email required";
                            } else if (value.length < 13) {
                              return "Invalid email";
                            } else {
                              return null;
                            }
                          },
                          controller: _emailController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1.0)),
                              labelText: "Email"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: FractionallySizedBox(
                        widthFactor: 0.8,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password required";
                            } else if (value.length < 6) {
                              return "Password should be at least 6 characters long";
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
                          controller: _passwordController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1.0)),
                              labelText: "Password"),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: _isLoading
                            ? const SizedBox(
                          width: 30,
                          height: 30,
                          child: (CircularProgressIndicator()),
                        )
                            : FractionallySizedBox(
                          widthFactor: 0.7,
                          child: (RegularButton(
                            text: "Login",
                            onPressed: login,
                          )),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "New User?",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/signup");
                            },
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                  color:
                                  Theme.of(context).colorScheme.secondary),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
