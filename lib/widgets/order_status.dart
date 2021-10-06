import 'package:flutter/material.dart';
import 'package:gentleman/widgets/horizontal_timeline.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FractionallySizedBox(
        widthFactor: 0.95,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.background,
          ),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Order No:",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text("0123456789",
                          style: TextStyle(
                              color: Theme.of(context).disabledColor,
                              fontSize: 16)),
                    ),
                  )
                ])),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Tracking No:",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                WidgetSpan(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text("0123456789",
                        style: TextStyle(
                            color: Theme.of(context).disabledColor,
                            fontSize: 16)),
                  ),
                )
              ])),
              const HorizontalTimeline()
            ],
          ),
        ),
      ),
    );
  }
}
