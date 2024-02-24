import 'package:flutter/material.dart';
import 'package:flutter_website/ui/carousel/carousel_text.dart';
import 'package:flutter_website/ui/carousel/model_carousel_item_animation.dart';

import 'animation_slide_up_down_fade.dart';

class CarouselSlide4 extends StatefulWidget {
  final int slideDuration;

  const CarouselSlide4({super.key, required this.slideDuration});

  @override
  State<CarouselSlide4> createState() => _CarouselSlide4State();
}

class _CarouselSlide4State extends State<CarouselSlide4>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  List<SlideItemAnimationModel> slideItems = [
    SlideItemAnimationModel(
        id: "slide_4-bg",
        entryDuration: 800,
        exitDuration: 500,
        entry: 0,
        exit: 166),
    SlideItemAnimationModel(
        id: "slide_4-layer_1",
        entryDuration: 800,
        exitDuration: 500,
        entry: 14,
        exit: 176),
    SlideItemAnimationModel(
        id: "slide_4-layer_2",
        entryDuration: 800,
        exitDuration: 500,
        entry: 25,
        exit: 171),
    SlideItemAnimationModel(
        id: "slide_4-text",
        entryDuration: 800,
        exitDuration: 500,
        entry: 37,
        exit: 159),
  ];
  final slideItemOffset = const Offset(0, 60);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: widget.slideDuration), vsync: this);
    animation = Tween<double>(begin: 0, end: 200).animate(animationController)
      ..addListener(() {
        setState(() {
          slideItems = getSlideItemAnimationUpdate(animation.value, slideItems);
        });
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1200,
      height: 640,
      child: Stack(
        children: [
          Positioned(
            left: 345,
            top: 132,
            width: 620,
            height: 345,
            child: WidgetSlideUpDownFadeAnimation(
              duration: getSlideItemAnimationDuration("slide_4-bg", slideItems),
              direction:
                  getSlideItemAnimationVisibility("slide_4-bg", slideItems),
              offset: slideItemOffset,
              child:
                  Image.asset("assets/images/slide_4-bg.jpg", fit: BoxFit.fill),
            ),
          ),
          Positioned(
            left: 232,
            top: 108,
            width: 735,
            height: 428,
            child: WidgetSlideUpDownFadeAnimation(
              duration:
                  getSlideItemAnimationDuration("slide_4-layer_1", slideItems),
              direction: getSlideItemAnimationVisibility(
                  "slide_4-layer_1", slideItems),
              offset: slideItemOffset,
              child: Image.asset("assets/images/slide_4-layer_1.png",
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            left: 187,
            top: 80,
            width: 901,
            height: 474,
            child: WidgetSlideUpDownFadeAnimation(
              duration:
                  getSlideItemAnimationDuration("slide_4-layer_2", slideItems),
              direction: getSlideItemAnimationVisibility(
                  "slide_4-layer_2", slideItems),
              offset: slideItemOffset,
              child: Image.asset("assets/images/slide_4-layer_2.png",
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            left: 441,
            top: 37,
            width: 317,
            height: 565,
            child:
                Image.asset("assets/images/device_frame.png", fit: BoxFit.fill),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 640,
              alignment: Alignment.center,
              child: WidgetSlideUpDownFadeAnimation(
                duration:
                    getSlideItemAnimationDuration("slide_4-text", slideItems),
                direction:
                    getSlideItemAnimationVisibility("slide_4-text", slideItems),
                offset: slideItemOffset,
                child: slide4Text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
