import 'package:flutter/material.dart';

class ProductResultCard extends StatefulWidget {
  const ProductResultCard({Key? key}) : super(key: key);

  @override
  _ProductResultCardState createState() => _ProductResultCardState();
}

class _ProductResultCardState extends State<ProductResultCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/product-details");
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 5.0, right: 10.0),
        child: SizedBox(
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/product_img.jpg",
                    fit: BoxFit.contain,
                    width: 135,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text("Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                        ),
                        Text("Price",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
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
                                  text: "100K",
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
              const Icon(Icons.chevron_right_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
