import 'package:flutter/material.dart';
import 'package:gentleman/widgets/regular_button.dart';

class ProductDetailFooter extends StatefulWidget {
  const ProductDetailFooter({Key? key}) : super(key: key);

  @override
  _ProductDetailFooterState createState() => _ProductDetailFooterState();
}

class _ProductDetailFooterState extends State<ProductDetailFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomRight,
        height: 65,
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
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
                      text: "100K",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary))
                ]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: 150,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: RegularButton(
                      onPressed: () {},
                      text: "Add to Cart",
                    )),
                Container(
                    width: 150,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: RegularButton(
                      onPressed: () {},
                      text: "Buy Now",
                    )),
              ],
            )
          ],
        ));
  }
}
