import 'package:flutter/material.dart';

class RegularButton extends StatelessWidget {
  const RegularButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.all(15.0),
            backgroundColor: Theme.of(context).colorScheme.primary),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ));
  }
}
