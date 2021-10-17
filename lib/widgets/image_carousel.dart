import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key? key, required this.images}) : super(key: key);

  final List images;

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
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
            itemCount: widget.images.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Image.network(
                      widget.images[itemIndex],
                      height: 300,
                      width: 300,
                    )),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.images.map((img) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentImgIndex == widget.images.indexOf(img)
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
