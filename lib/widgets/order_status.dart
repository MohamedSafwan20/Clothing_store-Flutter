import 'package:flutter/material.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/services/user_service.dart';
import 'package:gentleman/widgets/horizontal_timeline.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus(
      {Key? key,
      required this.productId,
      this.orderNo = "",
      this.paymentMode = "",
      this.name = "",
      this.phoneNo = "",
      this.address = "",
      required this.status})
      : super(key: key);

  final String productId;
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
              ),
              widget.status == "DELIVERED"
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Love this product?",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 17),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Give it a",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              FutureBuilder(
                                  future:
                                      DbService.getLikedUsers(widget.productId),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      if (snapshot.hasData) {
                                        bool isUserAlreadyLiked = false;
                                        snapshot.data["liked_by"]
                                            ?.forEach((userId) {
                                          if (userId ==
                                              UserService.getCurrentUserId()) {
                                            isUserAlreadyLiked = true;
                                          }
                                        });
                                        return isUserAlreadyLiked
                                            ? IconButton(
                                                icon: Icon(
                                                  Icons.thumb_up,
                                                  size: 24,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                                onPressed: () {
                                                  DbService.removeLike(
                                                          UserService
                                                              .getCurrentUserId(),
                                                          widget.productId)
                                                      .then((value) {
                                                    if (value) {
                                                      Navigator.pop(context);
                                                    }
                                                  });
                                                },
                                              )
                                            : IconButton(
                                                icon: Icon(
                                                  Icons.thumb_up_outlined,
                                                  size: 24,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                                onPressed: () {
                                                  DbService.addLike(
                                                          UserService
                                                              .getCurrentUserId(),
                                                          widget.productId)
                                                      .then((value) {
                                                    if (value) {
                                                      Navigator.pop(context);
                                                    }
                                                  });
                                                },
                                              );
                                      }
                                    }
                                    return Container();
                                  })
                            ],
                          )
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
