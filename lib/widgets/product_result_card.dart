import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/services/user_service.dart';

class ProductResultCard extends StatefulWidget {
  const ProductResultCard(
      {Key? key, required this.productData, required this.id, this.page = ""})
      : super(key: key);

  final Map productData;
  final String id;
  final String page;

  @override
  _ProductResultCardState createState() => _ProductResultCardState();
}

class _ProductResultCardState extends State<ProductResultCard> {
  void deleteFromCart() {
    DbService.deleteFromCart(UserService.getCurrentUserId(), widget.id)
        .then((value) {
      if (value) {
        final snackbar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Product Successfully Deleted from cart',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      } else {
        final snackbar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Deleting from cart failed!',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/product-details",
            arguments: {"id": widget.id});
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8, bottom: 5.0),
        child: Column(
          children: [
            Row(
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
                      padding: const EdgeInsets.only(left: 8.0),
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary)),
                            ),
                          ),
                          Text("₹${widget.productData['product_price']}",
                              style: TextStyle(
                                  color:
                                  Theme.of(context).colorScheme.secondary,
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
                widget.page == "cart"
                    ? IconButton(
                        onPressed: deleteFromCart,
                        icon: const Icon(Icons.delete),
                        color: Theme.of(context).colorScheme.error,
                      )
                    : const Icon(Icons.chevron_right_outlined)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: Theme.of(context).disabledColor,
                thickness: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
