import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductResultCard extends StatefulWidget {
  const ProductResultCard(
      {Key? key, required this.productData, required this.id})
      : super(key: key);

  final Map productData;
  final String id;

  @override
  _ProductResultCardState createState() => _ProductResultCardState();
}

class _ProductResultCardState extends State<ProductResultCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/product-details",
            arguments: {"id": widget.id});
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 5.0, right: 10.0),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    widget.productData["product_images"][0],
                    fit: BoxFit.contain,
                    width: 135,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 200,
                            child: Text(widget.productData["product_name"],
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                          ),
                        ),
                        Text("₹${widget.productData['product_price']}",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 14)),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: RichText(
                            text: TextSpan(children: [
                              const WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 3.0),
                                  child: Icon(
                                    Icons.thumb_up,
                                    size: 18,
                                  ),
                                ),
                              ),
                              TextSpan(
                                  text: widget.productData["likes"],
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
  }
}
