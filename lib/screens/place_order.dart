import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gentleman/widgets/payment_section.dart';
import 'package:gentleman/widgets/regular_button.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({Key? key}) : super(key: key);

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void placeOrder() {
    if (_formKey.currentState!.validate()) {
      print("valid");
    } else {
      print("invalid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Place Order",
          style: TextStyle(color: Theme.of(context).canvasColor, fontSize: 16),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).canvasColor),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "Address",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                        FractionallySizedBox(
                            widthFactor: 0.9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 5.0),
                                  child: Text(
                                    "Full Name",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                TextFormField(
                                  controller: _fullNameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Name required";
                                    } else if (value.length < 3) {
                                      return "Name must be 3 characters long";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(6.0),
                                      border: OutlineInputBorder()),
                                )
                              ],
                            )),
                        FractionallySizedBox(
                          widthFactor: 0.9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 5.0),
                                child: Text(
                                  "Phone Number",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              TextFormField(
                                controller: _phoneNoController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Phone Number required";
                                  } else if (value.length != 10) {
                                    return "Invalid Phone Number";
                                  } else {
                                    return null;
                                  }
                                },
                                maxLength: 10,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(6.0),
                                    border: OutlineInputBorder()),
                              )
                            ],
                          ),
                        ),
                        FractionallySizedBox(
                            widthFactor: 0.9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 5.0),
                                  child: Text(
                                    "Address",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                TextFormField(
                                  controller: _addressController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Address required";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 8,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(6.0),
                                      border: OutlineInputBorder()),
                                )
                              ],
                            )),
                        FractionallySizedBox(
                            widthFactor: 0.9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 5.0),
                                  child: Text(
                                    "District",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                TextFormField(
                                  controller: _districtController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "District required";
                                    } else if (value.toUpperCase() !=
                                        "MALAPPURAM") {
                                      return "We now only delivering to Malappuram only.";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(6.0),
                                      border: OutlineInputBorder()),
                                )
                              ],
                            )),
                        FractionallySizedBox(
                            widthFactor: 0.9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 5.0),
                                  child: Text(
                                    "Pin Code",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                TextFormField(
                                  controller: _pincodeController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Pincode required";
                                    } else if (value.length != 6) {
                                      return "Invalid Pincode";
                                    } else {
                                      return null;
                                    }
                                  },
                                  maxLength: 6,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(6.0),
                                      border: OutlineInputBorder()),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              PaymentsSection(),
              Container(
                color: Theme.of(context).colorScheme.background,
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Product Price",
                                style: TextStyle(
                                    color: Theme.of(context).disabledColor,
                                    fontSize: 16)),
                            Text(
                              "₹250",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 16),
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery Fee",
                                style: TextStyle(
                                    color: Theme.of(context).disabledColor,
                                    fontSize: 16)),
                            Text(
                              "₹40",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 16),
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total",
                                style: TextStyle(
                                    color: Theme.of(context).disabledColor,
                                    fontSize: 16)),
                            Text(
                              "₹290",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 16),
                            )
                          ]),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: FractionallySizedBox(
                            widthFactor: 0.5,
                            child: RegularButton(
                              onPressed: placeOrder,
                              text: "Place Order",
                            )),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
