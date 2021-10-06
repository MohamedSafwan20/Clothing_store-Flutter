import 'package:flutter/material.dart';
import 'package:gentleman/widgets/product_card.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
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
                  widget.category,
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
