import 'package:flutter/material.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/services/user_service.dart';
import 'package:gentleman/widgets/error.dart';
import 'package:gentleman/widgets/loading.dart';
import 'package:gentleman/widgets/product_result_card.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(color: Theme.of(context).canvasColor, fontSize: 16),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).canvasColor),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: FutureBuilder(
                future: DbService.getCartItems(UserService.getCurrentUserId()),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data['products'].length,
                          itemBuilder: (context, index) {
                            return FutureBuilder(
                                future: DbService.getRefData(
                                    snapshot.data["products"][index]),
                                builder:
                                    (context, AsyncSnapshot productSnapshot) {
                                  if (productSnapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (productSnapshot.hasData) {
                                      return Column(
                                        children: [
                                          ProductResultCard(
                                            productData: productSnapshot.data,
                                            id: snapshot
                                                .data["products"][index].id,
                                            page: "cart",
                                          ),
                                        ],
                                      );
                                    } else {
                                      return const Error();
                                    }
                                  } else {
                                    return const Loading();
                                  }
                                });
                          });
                    } else {
                      return const Error();
                    }
                  } else {
                    return const Loading();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
