import 'package:flutter/material.dart';
import 'package:gentleman/widgets/address_section.dart';
import 'package:gentleman/widgets/payment_section.dart';
import 'package:gentleman/widgets/place_order_footer.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({Key? key}) : super(key: key);

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Place Order",
          style: TextStyle(color: Theme.of(context).canvasColor, fontSize: 16),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).canvasColor),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AddressSection(),
              PaymentsSection(),
              PlaceOrderFooter()
            ],
          ),
        ),
      ),
    );
  }
}
