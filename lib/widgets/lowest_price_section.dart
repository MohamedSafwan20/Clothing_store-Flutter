import 'package:flutter/material.dart';
import 'package:gentleman/widgets/product_card.dart';

class LowestPriceSection extends StatefulWidget {
  const LowestPriceSection({Key? key}) : super(key: key);

  @override
  _LowestPriceSectionState createState() => _LowestPriceSectionState();
}

class _LowestPriceSectionState extends State<LowestPriceSection> {
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
            child: Text(
              "Lowest In Price",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ),
          SingleChildScrollView(
            child: GridView.count(
              physics: const ScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              children: const [
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}