import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {Key? key,
      required this.name,
      required this.price,
      required this.description})
      : super(key: key);

  final String name;
  final String price;
  final String description;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.93,
      child: InkWell(
        onTap: () {},
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/product_img.jpg"),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.primary)),
                    Text(widget.price,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 14)),
                    Text(widget.description,
                        overflow: TextOverflow.ellipsis,
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
    );
  }
}
