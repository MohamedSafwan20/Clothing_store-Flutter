import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.86,
      child: Container(
        constraints: const BoxConstraints(minHeight: 200),
        child: InkWell(
          onTap: () {},
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/product_img.jpg"),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.primary)),
                      Text("Price",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 14)),
                      Text("Description",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).disabledColor)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
