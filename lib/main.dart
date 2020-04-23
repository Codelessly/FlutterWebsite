import 'package:flutter/material.dart';
import 'package:flutter_website/ui/carousel/carousel.dart';

import 'components/components.dart';
import 'responsive_framework/responsive_framework.dart';
import 'ui/blocks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint(breakpoint: 450, name: MOBILE),
            ResponsiveBreakpoint(breakpoint: 800, name: DESKTOP),
          ],
          background: Container(color: background)),
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
              GetStarted(),
              Features(),
              FastDevelopment(),
              BeautifulUI(),
              NativePerformance(),
              LearnFromDevelopers(),
              WhoUsesFlutter(),
              FlutterNewsRow(),
              FlutterCodelab(),
              InstallFlutter(),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
