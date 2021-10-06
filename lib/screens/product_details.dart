import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gentleman/widgets/image_carousel.dart';
import 'package:gentleman/widgets/navbar.dart';
import 'package:gentleman/widgets/product_detail_body.dart';
import 'package:gentleman/widgets/product_detail_footer.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  NavBar(),
                  ImageCarousel(),
                  ProductDetailBody()
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const ProductDetailFooter());
  }
}
