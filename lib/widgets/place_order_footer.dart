import 'package:flutter/material.dart';
import 'package:gentleman/widgets/regular_button.dart';

class PlaceOrderFooter extends StatefulWidget {
  const PlaceOrderFooter({Key? key}) : super(key: key);

  @override
  _PlaceOrderFooterState createState() => _PlaceOrderFooterState();
}

class _PlaceOrderFooterState extends State<PlaceOrderFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product Price",
                      style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontSize: 16)),
                  Text(
                    "₹250",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16),
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery Fee",
                      style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontSize: 16)),
                  Text(
                    "₹40",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16),
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",
                      style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontSize: 16)),
                  Text(
                    "₹290",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16),
                  )
                ]),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: RegularButton(
                    onPressed: () {},
                    text: "Place Order",
                  )),
            ),
          )
        ],
      ),
    );
  }
}
