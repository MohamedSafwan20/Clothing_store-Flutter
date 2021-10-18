import 'package:flutter/material.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/services/user_service.dart';
import 'package:gentleman/widgets/regular_button.dart';

class ProductDetailFooter extends StatefulWidget {
  const ProductDetailFooter({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  _ProductDetailFooterState createState() => _ProductDetailFooterState();
}

class _ProductDetailFooterState extends State<ProductDetailFooter> {
  String _likes = "";

  bool _isAddToCartLoading = false;

  @override
  void initState() {
    DbService.getProductDetails(widget.id).then((value) {
      setState(() {
        _likes = value["likes"];
      });
    });
    super.initState();
  }

  void addToCart() {
    setState(() {
      _isAddToCartLoading = true;
    });
    DbService.addToCart(UserService.getCurrentUserId(), widget.id)
        .then((value) {
      if (value) {
        setState(() {
          _isAddToCartLoading = false;
        });
        final snackbar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Product Successfully Added to cart.',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      } else {
        setState(() {
          _isAddToCartLoading = false;
        });
        final snackbar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Adding to cart failed.',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    });
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
                    child: _isAddToCartLoading
                        ? Container(
                            width: 30,
                            height: 20,
                            padding: const EdgeInsets.only(right: 10.0),
                            child: const CircularProgressIndicator(),
                          )
                        : RegularButton(
                            onPressed: addToCart,
                            text: "Add to Cart",
                          )),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: RegularButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/place-order",
                            arguments: {"productId": widget.id});
                      },
                      text: "Buy Now",
                    )),
              ],
            )
          ],
        ));
  }
}
