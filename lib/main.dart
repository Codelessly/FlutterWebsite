import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'components/components.dart';
import 'ui/blocks.dart';
import 'ui/carousel/carousel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  double maxWidth = 1280;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          defaultScale: true,
          minWidth: 480,
          defaultName: MOBILE,
          breakpoints: [
            ResponsiveBreakpoint.autoScale(480, name: MOBILE),
            ResponsiveBreakpoint.resize(600, name: "TABLET_MINI"),
            ResponsiveBreakpoint.resize(800, name: TABLET),
            ResponsiveBreakpoint.tag(1000, name: DESKTOP),
            ResponsiveBreakpoint.autoScaleDown(1280, name: DESKTOP),
            ResponsiveBreakpoint.resize(1280, name: DESKTOP),
          ],
          background: Container(color: background),
          debugLog: true),
      home: Scaffold(
        appBar: PreferredSize(
            child: MenuBar(), preferredSize: Size(double.infinity, 66)),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              ResponsiveWrapper(
                  maxWidth: 1200,
                  minWidth: 1200,
                  defaultScale: true,
                  mediaQueryData: MediaQueryData(size: Size(1200, 640)),
                  child: Carousel()),
              Container(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: GetStarted()),
              Container(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: Features()),
              Container(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: FastDevelopment()),
              Container(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: BeautifulUI()),
              Container(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: NativePerformance()),
              Container(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: LearnFromDevelopers()),
              Container(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: WhoUsesFlutter()),
              Container(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: FlutterNewsRow()),
              ResponsiveVisibility(
                hiddenWhen: [Condition.smallerThan(name: DESKTOP)],
                child: Container(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: FlutterCodelab()),
              ),
              Container(
                  constraints: BoxConstraints(maxWidth: maxWidth),
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
