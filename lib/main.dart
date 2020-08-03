import 'package:flutter/material.dart';
import 'package:flutter_website/ui/carousel/carousel.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'components/components.dart';
import 'ui/blocks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget),
          defaultScale: true,
          minWidth: 480,
          defaultName: MOBILE,
          breakpoints: [
            ResponsiveBreakpoint.autoScale(480, name: MOBILE),
            ResponsiveBreakpoint.resize(600, name: MOBILE),
            ResponsiveBreakpoint.resize(850, name: TABLET),
            ResponsiveBreakpoint.resize(1080, name: DESKTOP),
          ],
          background: Container(color: background)),
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 66), child: MenuBar()),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              ResponsiveWrapper(
                  maxWidth: 1200,
                  minWidth: 1200,
                  defaultScale: true,
                  mediaQueryData: MediaQueryData(size: Size(1200, 640)),
                  child: RepaintBoundary(child: Carousel())),
              ResponsiveConstraints(
                  constraintsWhen: blockWidthConstraints, child: GetStarted()),
              ResponsiveConstraints(
                  constraintsWhen: blockWidthConstraints, child: Features()),
//              ResponsiveVisibility(
//                hiddenWhen: [Condition.smallerThan(name: DESKTOP)],
//                child: ResponsiveConstraints(
//                    constraintsWhen: blockWidthConstraints,
//                    child: FlutterCodelab()),
//              ),
              ResponsiveConstraints(
                  constraintsWhen: blockWidthConstraints,
                  child: FastDevelopment()),
              ResponsiveConstraints(
                  constraintsWhen: blockWidthConstraints, child: BeautifulUI()),
              ResponsiveConstraints(
                  constraintsWhen: blockWidthConstraints,
                  child: NativePerformance()),
              ResponsiveConstraints(
                  constraintsWhen: blockWidthConstraints,
                  child: LearnFromDevelopers()),
              ResponsiveConstraints(
                  constraintsWhen: blockWidthConstraints,
                  child: WhoUsesFlutter()),
              ResponsiveConstraints(
                  constraintsWhen: blockWidthConstraints,
                  child: FlutterNewsRow()),
              ResponsiveConstraints(
                  constraintsWhen: blockWidthConstraints,
                  child: InstallFlutter()),
              Footer(),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
