import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gentleman/widgets/navbar.dart';

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
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/product-details");
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, bottom: 5.0, right: 10.0),
                          child: SizedBox(
                            height: 120,
                            child: Row(
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
                                            child: RichText(
                                              text: TextSpan(children: [
                                                const WidgetSpan(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 3.0),
                                                    child: Icon(
                                                      Icons.thumb_up,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                TextSpan(
                                                    text: "100K",
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary))
                                              ]),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Icon(Icons.chevron_right_outlined)
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
