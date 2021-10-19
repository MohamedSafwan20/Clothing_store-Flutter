import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/widgets/error.dart';
import 'package:gentleman/widgets/loading.dart';
import 'package:gentleman/widgets/regular_button.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({Key? key}) : super(key: key);

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  int _currentPaymentOption = 2;

  late Map navigatorData;

  void placeOrder() {
    if (_formKey.currentState!.validate()) {
      String paymentMode;

      switch (_currentPaymentOption) {
        case 0:
          paymentMode = "GPAY";
          break;
        case 1:
          paymentMode = "PAYTM";
          break;
        case 2:
          paymentMode = "COD";
          break;
        default:
          paymentMode = "";
      }

      DbService.addOrder(
              _addressController.text,
              _fullNameController.text,
              _phoneNoController.text,
              paymentMode,
              navigatorData["productId"],
              navigatorData["productSize"])
          .then((value) {
        if (value) {
          Navigator.pushReplacementNamed(context, "/success-order");
        } else {
          final snackbar = SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(
              "Couldn't place order.",
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      }).catchError((_) {
        final snackbar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Something went wrong, Please try again later.',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    navigatorData = ModalRoute.of(context)!.settings.arguments as Map;

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
            child: FutureBuilder(
              future: DbService.getProductDetails(navigatorData["productId"]),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    String deliveryFee =
                        int.parse(snapshot.data["product_price"]) > 199
                            ? "0"
                            : "40";
                    String total = (int.parse(snapshot.data["product_price"]) +
                            int.parse(deliveryFee))
                        .toString();

                    return Column(
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
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      "Address",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                    ),
                                  ),
                                  FractionallySizedBox(
                                      widthFactor: 0.9,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.0, vertical: 5.0),
                                            child: Text(
                                              "Full Name",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
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
                                            decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(6.0),
                                                border: OutlineInputBorder()),
                                          )
                                        ],
                                      )),
                                  FractionallySizedBox(
                                    widthFactor: 0.9,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.0, vertical: 5.0),
                                          child: Text(
                                            "Phone Number",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
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
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.all(6.0),
                                              border: OutlineInputBorder()),
                                        )
                                      ],
                                    ),
                                  ),
                                  FractionallySizedBox(
                                      widthFactor: 0.9,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.0, vertical: 5.0),
                                            child: Text(
                                              "Address",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
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
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: 8,
                                            decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(6.0),
                                                border: OutlineInputBorder()),
                                          )
                                        ],
                                      )),
                                  FractionallySizedBox(
                                      widthFactor: 0.9,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.0, vertical: 5.0),
                                            child: Text(
                                              "District",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
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
                                            decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(6.0),
                                                border: OutlineInputBorder()),
                                          )
                                        ],
                                      )),
                                  FractionallySizedBox(
                                      widthFactor: 0.9,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.0, vertical: 5.0),
                                            child: Text(
                                              "Pin Code",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
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
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(6.0),
                                                border: OutlineInputBorder()),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 15.0),
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
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: FractionallySizedBox(
                                    widthFactor: 0.9,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .disabledColor),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              blurRadius: 2.0,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ListTile(
                                        onTap: () {
                                          setState(() {
                                            _currentPaymentOption = 2;
                                          });
                                        },
                                        leading: Radio(
                                          value: _currentPaymentOption,
                                          activeColor: Theme.of(context)
                                              .colorScheme
                                              .secondary,
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
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Image.asset(
                                                "assets/images/cod-logo.png",
                                                height: 30,
                                                width: 30,
                                              ),
                                            ),
                                            const Text(
                                              "Cash On Delivery",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: FractionallySizedBox(
                                    widthFactor: 0.9,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .disabledColor),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              blurRadius: 2.0,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ListTile(
                                        // onTap: () {
                                        //   setState(() {
                                        //     _currentPaymentOption = 0;
                                        //   });
                                        // },
                                        leading: Radio(
                                          value: _currentPaymentOption,
                                          activeColor: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          groupValue: 0,
                                          onChanged: (int? value) {
                                            // setState(() {
                                            //   _currentPaymentOption = 0;
                                            // });
                                          },
                                        ),
                                        title: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Image.asset(
                                                "assets/images/gpay-logo.png",
                                                height: 30,
                                                width: 30,
                                              ),
                                            ),
                                            Text(
                                              "GPay (Coming Soon)",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .disabledColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: FractionallySizedBox(
                                    widthFactor: 0.9,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .disabledColor),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              blurRadius: 2.0,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ListTile(
                                        onTap: () {
                                          // setState(() {
                                          //   _currentPaymentOption = 1;
                                          // });
                                        },
                                        leading: Radio(
                                          value: _currentPaymentOption,
                                          activeColor: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          groupValue: 1,
                                          onChanged: (int? value) {
                                            // setState(() {
                                            //   _currentPaymentOption = 1;
                                            // });
                                          },
                                        ),
                                        title: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Image.asset(
                                                "assets/images/paytm-logo.png",
                                                height: 30,
                                                width: 30,
                                              ),
                                            ),
                                            Text(
                                              "Paytm (Coming Soon)",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .disabledColor),
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
                        ),
                        Container(
                          color: Theme.of(context).colorScheme.background,
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Product Price",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              fontSize: 16)),
                                      Text(
                                        "₹${snapshot.data["product_price"]}",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontSize: 16),
                                      )
                                    ]),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Delivery Fee",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              fontSize: 16)),
                                      Text(
                                        "₹$deliveryFee",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontSize: 16),
                                      )
                                    ]),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              fontSize: 16)),
                                      Text(
                                        "₹$total",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
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
                    );
                  } else {
                    return const Error();
                  }
                } else {
                  return const Loading();
                }
              },
            )),
      ),
    );
  }
}
