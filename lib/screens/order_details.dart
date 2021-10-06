import 'package:flutter/material.dart';
import 'package:gentleman/widgets/image_carousel.dart';
import 'package:gentleman/widgets/order_status.dart';
import 'package:gentleman/widgets/product_detail_body.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Details",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImageCarousel(),
              const ProductDetailBody(),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                child: Text("Order Status",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
              ),
              const OrderStatus(),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text("Cancel Order")),
                      style: OutlinedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.error,
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
