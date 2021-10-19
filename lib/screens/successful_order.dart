import 'package:flutter/material.dart';

class SuccessfulOrder extends StatefulWidget {
  const SuccessfulOrder({Key? key}) : super(key: key);

  @override
  _SuccessfulOrderState createState() => _SuccessfulOrderState();
}

class _SuccessfulOrderState extends State<SuccessfulOrder>
    with TickerProviderStateMixin {
  late Animation<double> _animation;

  @override
  void initState() {
    AnimationController _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    color: Theme.of(context).colorScheme.primary,
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ScaleTransition(
                            scale: _animation,
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.check,
                                    size: 120.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background))),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: FractionallySizedBox(
                              widthFactor: 0.5,
                              child: Text(
                                "Your order has been successfully placed.",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800),
                                textAlign: TextAlign.center,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, "/my-orders");
                            },
                            child: FractionallySizedBox(
                              widthFactor: 0.5,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "Go to ",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  TextSpan(
                                      text: "My Orders",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                          decoration:
                                              TextDecoration.underline)),
                                ]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )))));
  }
}
