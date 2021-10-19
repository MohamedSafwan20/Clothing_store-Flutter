import 'package:flutter/material.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/services/user_service.dart';
import 'package:gentleman/widgets/delivered_orders.dart';
import 'package:gentleman/widgets/loading.dart';
import 'package:gentleman/widgets/pending_orders.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                indicatorColor: Theme.of(context).colorScheme.secondary,
                tabs: const [
                  Tab(
                    text: "Pending",
                  ),
                  Tab(text: "Delivered"),
                ],
              ),
              iconTheme: IconThemeData(color: Theme.of(context).canvasColor),
              title: Text(
                "My Orders",
                style: TextStyle(
                    color: Theme.of(context).canvasColor, fontSize: 16),
              ),
              centerTitle: true,
            ),
            body: FutureBuilder(
              future:
                  DbService.getAllUserOrders(UserService.getCurrentUserId()),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List pendingOrders = snapshot.data["products"]
                        .where((product) => product["status"] != "DELIVERED")
                        .toList();
                    return TabBarView(
                      children: [
                        PendingOrders(productData: pendingOrders),
                        DeliveredOrders()
                      ],
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://cdn-icons-png.flaticon.com/512/1103/1103140.png",
                            width: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              "You didn't have any orders.",
                              style: TextStyle(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                } else {
                  return Loading();
                }
              },
            )));
  }
}
