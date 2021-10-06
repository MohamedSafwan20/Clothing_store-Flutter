import 'package:flutter/material.dart';

class PendingOrders extends StatefulWidget {
  const PendingOrders({Key? key}) : super(key: key);

  @override
  _PendingOrdersState createState() => _PendingOrdersState();
}

class _PendingOrdersState extends State<PendingOrders> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/images/product_img.jpg",
                                      fit: BoxFit.contain,
                                      width: 135,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 4.0),
                                            child: Text("Name",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary)),
                                          ),
                                          Text("Price",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                  fontSize: 14)),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12.0),
                                              child: Text(
                                                "Delivery In 1 Hour",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .indicatorColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
