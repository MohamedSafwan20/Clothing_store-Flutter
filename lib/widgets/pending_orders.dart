import 'package:flutter/material.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/widgets/error.dart';
import 'package:gentleman/widgets/loading.dart';

class PendingOrders extends StatefulWidget {
  const PendingOrders({Key? key, required this.productData}) : super(key: key);

  final List productData;

  @override
  _PendingOrdersState createState() => _PendingOrdersState();
}

class _PendingOrdersState extends State<PendingOrders> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ListView.builder(
            itemCount: widget.productData.length,
            itemBuilder: (context, index) {
              return FutureBuilder(
                  future: DbService.getRefData(
                      widget.productData[index]["product_id"]),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 15.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "/order-details",
                                      arguments: {
                                        "productData": widget.productData[index]
                                      });
                                },
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.network(
                                                snapshot.data["product_images"]
                                                    [0],
                                                fit: BoxFit.contain,
                                                width: 135,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 4.0),
                                                      child: Text(
                                                          snapshot.data[
                                                              "product_name"],
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary)),
                                                    ),
                                                    Text(
                                                        "₹${snapshot.data['product_price']}",
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .secondary,
                                                            fontSize: 14)),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 12.0),
                                                        child: Text(
                                                          widget.productData[
                                                              index]["status"],
                                                          style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .indicatorColor,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
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
                      } else {
                        return const Error();
                      }
                    } else {
                      return const Loading();
                    }
                  });
            }));
  }
}
