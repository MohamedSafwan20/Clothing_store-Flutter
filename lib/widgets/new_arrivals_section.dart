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
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "New Arrivals",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            children: [
              ProductCard(),
              ProductCard(),
            ],
          )
        ],
      ),
    );
  }
}
