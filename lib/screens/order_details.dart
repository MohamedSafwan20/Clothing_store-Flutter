import 'package:flutter/material.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/services/user_service.dart';
import 'package:gentleman/widgets/order_status.dart';
import 'package:gentleman/widgets/regular_button.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  late Map navigatorData;

  void cancelOrder() {
    DbService.deleteOrder(
        UserService.getCurrentUserId(), navigatorData["productData"]);
  }

  @override
  Widget build(BuildContext context) {
    navigatorData = ModalRoute.of(context)!.settings.arguments as Map;

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
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: RegularButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, "/product-details", arguments: {
                            "id": navigatorData["productData"]["product_id"].id
                          });
                        },
                        text: "See Product",
                      ),
                    ),
                  )),
              OrderStatus(
                orderNo: navigatorData["productData"]["order_no"],
                name: navigatorData["productData"]["buyer_name"],
                address: navigatorData["productData"]["buyer_address"],
                phoneNo: navigatorData["productData"]["buyer_phone"],
                paymentMode: navigatorData["productData"]["payment_method"],
                status: navigatorData["productData"]["status"],
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: OutlinedButton(
                      onPressed: cancelOrder,
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
