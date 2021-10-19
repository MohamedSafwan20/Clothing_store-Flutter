import 'package:flutter/material.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/services/user_service.dart';
import 'package:gentleman/utils/utils.dart';
import 'package:gentleman/widgets/order_status.dart';
import 'package:gentleman/widgets/regular_button.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  late Map navigatorData;

  bool _isLoading = false;

  void cancelOrder() {
    setState(() {
      _isLoading = true;
    });

    DbService.deleteOrder(
            UserService.getCurrentUserId(), navigatorData["productData"])
        .then((value) {
      if (value) {
        setState(() {
          _isLoading = false;
        });
        Utils.showSnackbar(
            context: context,
            text: "Order Successfully cancelled.",
            textColor: Theme.of(context).colorScheme.secondary);
        Navigator.pushReplacementNamed(context, "/my-orders");
      } else {
        setState(() {
          _isLoading = false;
        });
        Utils.showSnackbar(
            context: context,
            text: "Couldn't cancel order, Please try again later.",
            textColor: Theme.of(context).colorScheme.error);
      }
    }).catchError((_) {
      setState(() {
        _isLoading = false;
      });
    });
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
                    child: _isLoading
                        ? Container(
                            width: 40,
                            height: 30,
                            padding: const EdgeInsets.only(right: 10.0),
                            child: const CircularProgressIndicator())
                        : navigatorData["productData"]["status"] != "DELIVERED"
                            ? FractionallySizedBox(
                                widthFactor: 0.5,
                                child: OutlinedButton(
                                  onPressed: () {
                                    Utils.simpleDialog(
                                        context: context,
                                        heading: "Are you sure?",
                                        body:
                                            "This order will be cancelled and deleted permanently.",
                                        positiveBtnFunction: cancelOrder);
                                  },
                                  child: const Align(
                                      alignment: Alignment.center,
                                      child: Text("Cancel Order")),
                                  style: OutlinedButton.styleFrom(
                                    primary:
                                        Theme.of(context).colorScheme.error,
                                    side: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                                  ),
                                ),
                              )
                            : Container()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
