import 'package:flutter/material.dart';

class PaymentsSection extends StatefulWidget {
  const PaymentsSection({Key? key}) : super(key: key);

  @override
  _PaymentsSectionState createState() => _PaymentsSectionState();
}

class _PaymentsSectionState extends State<PaymentsSection> {
  int _currentPaymentOption = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                "Payment Options",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Theme.of(context).disabledColor),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).disabledColor,
                          blurRadius: 2.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        _currentPaymentOption = 0;
                      });
                    },
                    leading: Radio(
                      value: _currentPaymentOption,
                      activeColor: Theme.of(context).colorScheme.secondary,
                      groupValue: 0,
                      onChanged: (int? value) {
                        setState(() {
                          _currentPaymentOption = 0;
                        });
                      },
                    ),
                    title: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset(
                            "assets/images/gpay-logo.png",
                            height: 30,
                            width: 30,
                          ),
                        ),
                        const Text(
                          "GPay",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Theme.of(context).disabledColor),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).disabledColor,
                          blurRadius: 2.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        _currentPaymentOption = 1;
                      });
                    },
                    leading: Radio(
                      value: _currentPaymentOption,
                      activeColor: Theme.of(context).colorScheme.secondary,
                      groupValue: 1,
                      onChanged: (int? value) {
                        setState(() {
                          _currentPaymentOption = 1;
                        });
                      },
                    ),
                    title: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset(
                            "assets/images/paytm-logo.png",
                            height: 30,
                            width: 30,
                          ),
                        ),
                        const Text(
                          "Paytm",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Theme.of(context).disabledColor),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).disabledColor,
                          blurRadius: 2.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        _currentPaymentOption = 2;
                      });
                    },
                    leading: Radio(
                      value: _currentPaymentOption,
                      activeColor: Theme.of(context).colorScheme.secondary,
                      groupValue: 2,
                      onChanged: (int? value) {
                        setState(() {
                          _currentPaymentOption = 2;
                        });
                      },
                    ),
                    title: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset(
                            "assets/images/cod-logo.png",
                            height: 30,
                            width: 30,
                          ),
                        ),
                        const Text(
                          "Cash On Delivery",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
