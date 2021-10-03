import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/widgets/regular_button.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  String error = "";

  void signup() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      DbService.signup(_emailController.text, _passwordController.text)
          .then((value) => {
                if (value["success"])
                  {
                    setState(() {
                      _isLoading = false;
                    }),
                    Navigator.pushNamed(context, "/")
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/logo.jpg",
                fit: BoxFit.contain,
                height: 150,
                width: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Form(
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
                                return "Password is required";
                              } else if (value.length < 6) {
                                return "Password should be at least 6 characters long";
                              } else {
                                return null;
                              }
                            },
                            controller: _passwordController,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Password"),
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
                                return "Confirm password required";
                              } else if (value != _passwordController.text) {
                                return "Passwords didn't match";
                              } else {
                                return null;
                              }
                            },
                            controller: _confirmPasswordController,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Confirm Password"),
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
                              : (RegularButton(
                                  text: "Signup",
                                  onPressed: signup,
                                ))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Existing User?",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/login");
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ))
                        ],
                      )
                    ],
                  ),
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
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
