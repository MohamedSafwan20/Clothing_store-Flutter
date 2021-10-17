import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ProductDetailBody extends StatefulWidget {
  const ProductDetailBody({Key? key, required this.productData})
      : super(key: key);

  final Map productData;

  @override
  _ProductDetailBodyState createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<ProductDetailBody> {
  int _selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    List sizes = widget.productData["product_size"];

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text("Size : ",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 17)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    child: ToggleSwitch(
                      minHeight: 40.0,
                      minWidth: 50.0,
                      borderWidth: 0.0,
                      activeBgColor: const [Color(0x55e0e0e0)],
                      activeFgColor: Theme.of(context).colorScheme.secondary,
                      inactiveBgColor: Colors.transparent,
                      inactiveFgColor: Theme.of(context).colorScheme.primary,
                      totalSwitches: sizes.length,
                      initialLabelIndex: 0,
                      labels: sizes.map((size) {
                        return size.toString();
                      }).toList(),
                      onToggle: (index) {
                        _selectedSize = index;
                      },
                    ),
                  ),
                ],
              )),
          Text(widget.productData["product_name"],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.primary)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("₹${widget.productData["product_price"]}",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 18)),
          ),
          Text(widget.productData["product_description"],
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
        ],
      ),
    );
  }
}
