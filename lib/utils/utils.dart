import 'package:flutter/material.dart';

class Utils {
  static Future<void> simpleDialog(
      {required BuildContext context,
      required String heading,
      required String body,
      String negativeBtnText = "No",
      String positiveBtnText = "Yes",
      required positiveBtnFunction}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(heading),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(body),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                negativeBtnText,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                positiveBtnText,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                positiveBtnFunction();
              },
            ),
          ],
        );
      },
    );
  }
}
