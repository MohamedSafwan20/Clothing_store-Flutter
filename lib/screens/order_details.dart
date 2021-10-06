import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Align(alignment: Alignment.center, child: Text("cancel")),
      style: OutlinedButton.styleFrom(
        primary: Theme.of(context).colorScheme.error,
        side: BorderSide(
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}
