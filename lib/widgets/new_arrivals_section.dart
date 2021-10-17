import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gentleman/widgets/product_card.dart';

class NewArrivalsSection extends StatefulWidget {
  const NewArrivalsSection({Key? key, required this.productData})
      : super(key: key);

  final List productData;

  @override
  _NewArrivalsSectionState createState() => _NewArrivalsSectionState();
}

class _NewArrivalsSectionState extends State<NewArrivalsSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Arrivals",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                InkWell(
                  onTap: () {},
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "View all",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    WidgetSpan(
                        child: Icon(
                      Icons.chevron_right_outlined,
                      size: 16,
                      color: Theme.of(context).colorScheme.secondary,
                    ))
                  ])),
                ),
              ],
            ),
          ),
          GridView.count(
              physics: const ScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              children: widget.productData.map((product) {
                return ProductCard(
                  id: product.id,
                  name: product["product_name"],
                  price: product["product_price"],
                  description: product["product_description"],
                  image: product["product_images"][0],
                );
              }).toList()),
        ],
      ),
    );
  }
}
