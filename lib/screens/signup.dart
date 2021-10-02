import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gentleman/widgets/regular_button.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void signup() {
    if (_formKey.currentState!.validate()) {
      print("valid");
    } else {
      print("invalid");
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
              Expanded(
                flex: 1,
                child: Image.network(
                  "https://image.freepik.com/free-vector/bow-tie-tuxedo-suit-gentleman-fashion-tailor-clothes-vintage-classic-logo-design_57043-572.jpg",
                  fit: BoxFit.contain,
                  height: 150,
                  width: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: FractionallySizedBox(
                          widthFactor: 0.8,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Phone number required";
                              } else if (value.length != 10) {
                                return "Phone number must be 10 characters long";
                              } else {
                                return null;
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Phone number"),
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
                                return "OTP required";
                              } else {
                                return null;
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: _otpController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(), labelText: "OTP"),
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
                              } else if (value.length < 8) {
                                return "Password must be at least 8 characters long";
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
                          child: RegularButton(
                            text: "Signup",
                            onPressed: signup,
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
    _phoneController.dispose();
    _otpController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
