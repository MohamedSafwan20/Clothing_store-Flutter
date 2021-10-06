import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NavBar(),
              Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const ProductResultCard();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
