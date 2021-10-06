import 'package:flutter/material.dart';

class ProductDetailBody extends StatefulWidget {
  const ProductDetailBody({Key? key}) : super(key: key);

  @override
  _ProductDetailBodyState createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<ProductDetailBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.primary)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Price",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 18)),
          ),
          const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec varius sapien in ligula dignissim auctor. Nunc congue condimentum nulla, et pharetra metus finibus rhoncus. Nunc dictum nisi facilisis, volutpat mi volutpat, interdum dui. Maecenas quis nisi condimentum, venenatis metus a, tempus turpis. Sed sit amet dui fringilla, condimentum felis non, maximus nulla. Aenean vitae lectus diam. Aenean molestie eget justo nec eleifend."
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec varius sapien in ligula dignissim auctor. Nunc congue condimentum nulla, et pharetra metus finibus rhoncus. Nunc dictum nisi facilisis, volutpat mi volutpat, interdum dui. Maecenas quis nisi condimentum, venenatis metus a, tempus turpis. Sed sit amet dui fringilla, condimentum felis non, maximus nulla. Aenean vitae lectus diam. Aenean molestie eget justo nec eleifend."
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec varius sapien in ligula dignissim auctor. Nunc congue condimentum nulla, et pharetra metus finibus rhoncus. Nunc dictum nisi facilisis, volutpat mi volutpat, interdum dui. Maecenas quis nisi condimentum, venenatis metus a, tempus turpis. Sed sit amet dui fringilla, condimentum felis non, maximus nulla. Aenean vitae lectus diam. Aenean molestie eget justo nec eleifend.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
        ],
      ),
    );
  }
}
