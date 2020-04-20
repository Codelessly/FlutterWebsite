import 'package:flutter/material.dart';
import 'package:flutter_website/ui/carousel/carousel_text.dart';
import 'package:flutter_website/ui/carousel/model_carousel_item_animation.dart';

import 'animation_slide_up_down_fade.dart';

class CarouselSlide2 extends StatefulWidget {
  final int slideDuration;

  const CarouselSlide2({Key key, @required this.slideDuration})
      : super(key: key);

  @override
  _CarouselSlide2State createState() => _CarouselSlide2State();
}

class _CarouselSlide2State extends State<CarouselSlide2>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  List<SlideItemAnimationModel> slideItems = [
    SlideItemAnimationModel(
        id: "slide_2-bg",
        entryDuration: 800,
        exitDuration: 500,
        entry: 0,
        exit: 164),
    SlideItemAnimationModel(
        id: "slide_2-layer_2",
        entryDuration: 800,
        exitDuration: 500,
        entry: 13,
        exit: 172),
    SlideItemAnimationModel(
        id: "slide_2-layer_1",
        entryDuration: 800,
        exitDuration: 500,
        entry: 17,
        exit: 178),
    SlideItemAnimationModel(
        id: "slide_2-text",
        entryDuration: 800,
        exitDuration: 500,
        entry: 33,
        exit: 159),
  ];
  final slideItemOffset = Offset(0, 60);

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
          this.slideItems =
              getSlideItemAnimationUpdate(animation.value, this.slideItems);
        });
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      height: 640,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 36,
            top: 136,
            width: 574,
            height: 327,
            child: WidgetSlideUpDownFadeAnimation(
              duration: getSlideItemAnimationDuration("slide_2-bg", slideItems),
              direction:
                  getSlideItemAnimationVisibility("slide_2-bg", slideItems),
              offset: slideItemOffset,
              child: Image.asset(
                "assets/images/slide_2-bg.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            left: 157,
            top: 138,
            width: 714,
            height: 298,
            child: WidgetSlideUpDownFadeAnimation(
              duration:
                  getSlideItemAnimationDuration("slide_2-layer_1", slideItems),
              direction: getSlideItemAnimationVisibility(
                  "slide_2-layer_1", slideItems),
              offset: slideItemOffset,
              child: Image.asset(
                "assets/images/slide_2-layer_1.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            left: 114,
            top: 105,
            width: 901,
            height: 396,
            child: WidgetSlideUpDownFadeAnimation(
              duration:
                  getSlideItemAnimationDuration("slide_2-layer_2", slideItems),
              direction: getSlideItemAnimationVisibility(
                  "slide_2-layer_2", slideItems),
              offset: slideItemOffset,
              child: Image.asset(
                "assets/images/slide_2-layer_2.png",
                fit: BoxFit.fill,
              ),
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
                    getSlideItemAnimationDuration("slide_2-text", slideItems),
                direction:
                    getSlideItemAnimationVisibility("slide_2-text", slideItems),
                offset: slideItemOffset,
                child: slide2Text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
