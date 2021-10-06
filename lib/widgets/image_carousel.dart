import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  List<String> images = [
    "assets/images/product_img.jpg",
    "assets/images/product2.jpg",
    "assets/images/product3.jpg",
    "assets/images/product4.jpg",
  ];

  final CarouselController _carouselController = CarouselController();
  int _currentImgIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            carouselController: _carouselController,
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentImgIndex = index;
                  });
                },
                scrollPhysics: const BouncingScrollPhysics(),
                enableInfiniteScroll: false,
                enlargeCenterPage: true),
            itemCount: images.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Image.asset(
                      images[itemIndex],
                      height: 300,
                      width: 300,
                    )),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((img) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentImgIndex == images.indexOf(img)
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
