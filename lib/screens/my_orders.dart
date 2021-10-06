import 'package:flutter/material.dart';
import 'package:gentleman/widgets/delivered_orders.dart';
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
            body: const TabBarView(
              children: [PendingOrders(), DeliveredOrders()],
            )));
  }
}
