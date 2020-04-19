import 'package:flutter/material.dart';
import 'package:flutter_website/ui/carousel/carousel.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              ResponsiveWrapper(
                  minWidth: 1200,
                  defaultScale: true,
                  mediaQueryData: MediaQueryData(size: Size(1200, 640)),
                  child: Carousel()),
            ],
          ),
        ),
      ),
      theme: Theme.of(context).copyWith(platform: TargetPlatform.android),
      debugShowCheckedModeBanner: false,
    );
  }
}
