import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/widgets/image_carousel.dart';
import 'package:gentleman/widgets/loading.dart';
import 'package:gentleman/widgets/navbar.dart';
import 'package:gentleman/widgets/product_detail_body.dart';
import 'package:gentleman/widgets/product_detail_footer.dart';
import 'package:gentleman/widgets/regular_button.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
                          return Column(
                            children: [
                              ImageCarousel(
                                images: snapshot.data["product_images"],
                              ),
                              ProductDetailBody(
                                productData: snapshot.data,
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
        bottomNavigationBar: ProductDetailFooter(
          id: navigatorData["id"],
        ));
  }
}
