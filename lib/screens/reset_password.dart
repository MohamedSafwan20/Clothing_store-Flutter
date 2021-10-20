import 'package:flutter/material.dart';
import 'package:gentleman/services/user_service.dart';
import 'package:gentleman/utils/utils.dart';
import 'package:gentleman/widgets/regular_button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  String error = "";

  void resetPassword() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        error = "";
      });
      UserService.resetPassword(_emailController.text).then((_) {
        setState(() {
          _isLoading = false;
        });
        Utils.showSnackbar(
            context: context,
            text: "Successfully sent reset password email",
            textColor: Theme.of(context).indicatorColor);
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      }).catchError((err) {
        setState(() {
          error = err.code;
          _isLoading = false;
        });
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
              const Text(
                "Reset Password",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
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
                                  text: "Send reset password email",
                                  onPressed: resetPassword,
                                )),
                              )),
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
    super.dispose();
  }
}
