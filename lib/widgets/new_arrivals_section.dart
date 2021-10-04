import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gentleman/widgets/product_card.dart';

class NewArrivalsSection extends StatefulWidget {
  const NewArrivalsSection({Key? key}) : super(key: key);

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
                Text(
                  "View all",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ],
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
