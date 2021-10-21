import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/services/user_service.dart';
import 'package:gentleman/utils/utils.dart';
import 'package:gentleman/widgets/image_carousel.dart';
import 'package:gentleman/widgets/loading.dart';
import 'package:gentleman/widgets/navbar.dart';
import 'package:gentleman/widgets/regular_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  User currentUser = FirebaseAuth.instance.currentUser!;

  int _selectedSize = 0;

  bool _isAddToCartLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void verifyEmail() {
    currentUser.sendEmailVerification();
    FirebaseAuth.instance.signOut();
    SharedPreferences.getInstance().then((value) {
      value.remove("userId");
      Utils.showSnackbar(
          context: context,
          text:
              "We sent a verification mail to your email. Please verify it, then login again.",
          textColor: Theme.of(context).colorScheme.secondary);
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
    });
  }

  void addToCart(String productId) {
    setState(() {
      _isAddToCartLoading = true;
    });
    DbService.addToCart(UserService.getCurrentUserId(), productId)
        .then((value) {
      if (value) {
        setState(() {
          _isAddToCartLoading = false;
        });
        final snackbar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Product Successfully Added to cart.',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      } else {
        setState(() {
          _isAddToCartLoading = false;
        });
        final snackbar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Adding to cart failed.',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }).catchError((_) {
      final snackbar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Adding to cart failed.',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    });
  }

  @override
  Widget build(BuildContext context) {
    Map navigatorData = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NavBar(),
                  FutureBuilder(
                    future: DbService.getProductDetails(navigatorData["id"]),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          List sizes = snapshot.data["product_size"];

                          return Column(
                            children: [
                              ImageCarousel(
                                images: snapshot.data["product_images"],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                        const EdgeInsets.only(bottom: 8.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Text("Size : ",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      fontSize: 17)),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.red),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      10)),
                                              child: ToggleSwitch(
                                                minHeight: 40.0,
                                                minWidth: 50.0,
                                                borderWidth: 0.0,
                                                activeBgColor: const [
                                                  Color(0x55e0e0e0)
                                                ],
                                                activeFgColor: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                                inactiveBgColor:
                                                Colors.transparent,
                                                inactiveFgColor:
                                                Theme.of(context)
                                                    .colorScheme
                                                    .primary,
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
                                    Text(snapshot.data["product_name"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary)),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                          "₹${snapshot.data["product_price"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              fontSize: 18)),
                                    ),
                                    Text(snapshot.data["product_description"],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14)),
                                  ],
                                ),
                              )
                            ],
                          );
                        } else {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height - 150,
                            child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: RegularButton(
                                          onPressed: () {
                                            setState(() {});
                                          },
                                          text: "Refresh"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Text(
                                        "Error occurred, Please refresh the page.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color:
                                            Theme.of(context).colorScheme.error,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                )),
                          );
                        }
                      } else {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height - 150,
                          child: const Center(child: Loading()),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
            alignment: Alignment.bottomRight,
            height: 65,
            padding: const EdgeInsets.only(bottom: 10.0),
            child: FutureBuilder(
              future: DbService.getProductDetails(navigatorData["id"]),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: RichText(
                            text: TextSpan(children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 3.0),
                                  child: Icon(
                                    Icons.thumb_up,
                                    color:
                                    Theme.of(context).colorScheme.primary,
                                    size: 18,
                                  ),
                                ),
                              ),
                              TextSpan(
                                  text: snapshot.data["likes"].toString(),
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary))
                            ]),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 5),
                                child: _isAddToCartLoading
                                    ? Container(
                                  width: 30,
                                  height: 20,
                                  padding:
                                  const EdgeInsets.only(right: 10.0),
                                  child:
                                  const CircularProgressIndicator(),
                                )
                                    : RegularButton(
                                  onPressed: () {
                                    addToCart(navigatorData["id"]);
                                  },
                                  text: "Add to Cart",
                                )),
                            Container(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 5),
                                child: RegularButton(
                                  onPressed: () {
                                    if (currentUser.emailVerified) {
                                      Navigator.pushNamed(
                                          context, "/place-order",
                                          arguments: {
                                            "productId": navigatorData["id"],
                                            "productSize":
                                                snapshot.data["product_size"]
                                                    [_selectedSize]
                                          });
                                    } else {
                                      Utils.simpleDialog(
                                          context: context,
                                          heading: "Verify Email",
                                          body:
                                              "You need to verify your email before purchasing.",
                                          positiveBtnFunction: verifyEmail,
                                          positiveBtnText: "Verify Email",
                                          negativeBtnText: "Go Back");
                                    }
                                  },
                                  text: "Buy Now",
                                )),
                          ],
                        )
                      ],
                    );
                  } else {
                    return Container();
                  }
                } else {
                  return Container(
                      width: 30,
                      height: 20,
                      padding: const EdgeInsets.only(right: 10.0),
                      child: const CircularProgressIndicator());
                }
              },
            )));
  }
}
