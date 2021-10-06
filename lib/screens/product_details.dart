import 'package:flutter/material.dart';
import 'package:gentleman/widgets/image_carousel.dart';
import 'package:gentleman/widgets/navbar.dart';

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
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [const NavBar(), ImageCarousel()],
          ),
        ),
      ),
    );
  }
}
