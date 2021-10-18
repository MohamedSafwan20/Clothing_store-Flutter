import 'package:flutter/material.dart';
import 'package:gentleman/widgets/product_card.dart';

class LowestPriceSection extends StatefulWidget {
  const LowestPriceSection({Key? key, required this.productData})
      : super(key: key);

  final List productData;

  @override
  _LowestPriceSectionState createState() => _LowestPriceSectionState();
}

class _LowestPriceSectionState extends State<LowestPriceSection> {
  @override
  Widget build(BuildContext context) {
    List products = widget.productData
        .where((product) => widget.productData.indexOf(product) <= 3)
        .toList();

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
                  "Lowest In Price",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/product-result",
                        arguments: {"page": "lowestPriceSection"});
                  },
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
                )
              ],
            ),
          ),
          GridView.count(
              physics: const ScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              children: products.map((product) {
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
