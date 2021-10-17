import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {Key? key,
      required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.image})
      : super(key: key);

  final String id;
  final String name;
  final String price;
  final String description;
  final String image;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.93,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/product-details",
              arguments: {"id": widget.id});
        },
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.image,
                height: 100,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.primary)),
                    Text("₹${widget.price}",
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
