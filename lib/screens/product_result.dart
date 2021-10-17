import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/widgets/error.dart';
import 'package:gentleman/widgets/loading.dart';
import 'package:gentleman/widgets/navbar.dart';
import 'package:gentleman/widgets/product_result_card.dart';

class ProductResult extends StatefulWidget {
  const ProductResult({Key? key}) : super(key: key);

  @override
  _ProductResultState createState() => _ProductResultState();
}

class _ProductResultState extends State<ProductResult> {
  @override
  Widget build(BuildContext context) {
    Map navigatorData = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: FutureBuilder(
              future:
                  DbService.getProductResults(navigatorData["product_name"]),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const NavBar(),
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return ProductResultCard(
                                  productData: snapshot.data[index].data(),
                                );
                              }),
                        )
                      ],
                    );
                  } else {
                    return const Error();
                  }
                } else {
                  return const Loading();
                }
              },
            )),
      ),
    );
  }
}
