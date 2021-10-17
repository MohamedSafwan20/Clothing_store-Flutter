import 'package:flutter/material.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/widgets/regular_button.dart';

class ProductDetailFooter extends StatefulWidget {
  const ProductDetailFooter({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  _ProductDetailFooterState createState() => _ProductDetailFooterState();
}

class _ProductDetailFooterState extends State<ProductDetailFooter> {
  String _likes = "";

  @override
  void initState() {
    DbService.getProductDetails(widget.id).then((value) {
      setState(() {
        _likes = value["likes"];
      });
    });
    super.initState();
  }

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
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: Icon(
                        Icons.thumb_up,
                        color: Theme.of(context).colorScheme.primary,
                        size: 18,
                      ),
                    ),
                  ),
                  TextSpan(
                      text: _likes,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary))
                ]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: RegularButton(
                      onPressed: () {},
                      text: "Add to Cart",
                    )),
                Container(
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
