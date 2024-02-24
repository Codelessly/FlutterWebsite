import 'package:flutter/material.dart';
import 'package:flutter_website/ui/carousel/carousel_text.dart';
import 'package:flutter_website/ui/carousel/model_carousel_item_animation.dart';

import 'animation_slide_up_down_fade.dart';

class CarouselSlide3 extends StatefulWidget {
  final int slideDuration;

  const CarouselSlide3({super.key, required this.slideDuration});

  @override
  State<CarouselSlide3> createState() => _CarouselSlide3State();
}

class _CarouselSlide3State extends State<CarouselSlide3>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  List<SlideItemAnimationModel> slideItems = [
    SlideItemAnimationModel(
        id: "slide_3-bg",
        entryDuration: 800,
        exitDuration: 500,
        entry: 0,
        exit: 162),
    SlideItemAnimationModel(
        id: "slide_3-layer_1",
        entryDuration: 800,
        exitDuration: 500,
        entry: 12,
        exit: 169),
    SlideItemAnimationModel(
        id: "slide_3-layer_2",
        entryDuration: 800,
        exitDuration: 500,
        entry: 23,
        exit: 175),
    SlideItemAnimationModel(
        id: "slide_3-text",
        entryDuration: 800,
        exitDuration: 500,
        entry: 34,
        exit: 157),
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
            left: 400,
            top: 117,
            width: 420,
            height: 395,
            child: WidgetSlideUpDownFadeAnimation(
              duration: getSlideItemAnimationDuration("slide_3-bg", slideItems),
              direction:
                  getSlideItemAnimationVisibility("slide_3-bg", slideItems),
              offset: slideItemOffset,
              child:
                  Image.asset("assets/images/slide_3-bg.jpg", fit: BoxFit.fill),
            ),
          ),
          Positioned(
            left: 260,
            top: 95,
            width: 801,
            height: 429,
            child: WidgetSlideUpDownFadeAnimation(
              duration:
                  getSlideItemAnimationDuration("slide_3-layer_1", slideItems),
              direction: getSlideItemAnimationVisibility(
                  "slide_3-layer_1", slideItems),
              offset: slideItemOffset,
              child: Image.asset("assets/images/slide_3-layer_1.png",
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            left: 194,
            top: 73,
            width: 906,
            height: 440,
            child: WidgetSlideUpDownFadeAnimation(
              duration:
                  getSlideItemAnimationDuration("slide_3-layer_2", slideItems),
              direction: getSlideItemAnimationVisibility(
                  "slide_3-layer_2", slideItems),
              offset: slideItemOffset,
              child: Image.asset("assets/images/slide_3-layer_2.png",
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
                    getSlideItemAnimationDuration("slide_3-text", slideItems),
                direction:
                    getSlideItemAnimationVisibility("slide_3-text", slideItems),
                offset: slideItemOffset,
                child: slide3Text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
