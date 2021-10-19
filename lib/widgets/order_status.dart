import 'package:flutter/material.dart';
import 'package:gentleman/widgets/horizontal_timeline.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus(
      {Key? key,
      this.orderNo = "",
      this.paymentMode = "",
      this.name = "",
      this.phoneNo = "",
      this.address = "",
      required this.status})
      : super(key: key);

  final String orderNo;
  final String name;
  final String address;
  final String phoneNo;
  final String paymentMode;
  final String status;

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
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 15.0),
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
                          color: Theme.of(context).disabledColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(widget.orderNo,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16)),
                    ),
                  )
                ])),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Name:",
                      style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(widget.name,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16)),
                    ),
                  )
                ])),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Address:",
                      style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(widget.address,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16)),
                    ),
                  )
                ])),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Phone Number:",
                      style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(widget.phoneNo,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16)),
                    ),
                  )
                ])),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Payment Mode:",
                      style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(widget.paymentMode,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16)),
                    ),
                  )
                ])),
              ),
              HorizontalTimeline(
                status: widget.status,
              )
            ],
          ),
        ),
      ),
    );
  }
}
