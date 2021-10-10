import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
            )),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text("Loading"),
        )
      ],
    );
  }
}
