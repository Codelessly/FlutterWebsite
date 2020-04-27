import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'components/components.dart';
import 'ui/blocks.dart';
import 'ui/carousel/carousel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
//          maxWidth: 1200,
          minWidth: 800,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint(breakpoint: 450, name: MOBILE),
            ResponsiveBreakpoint(
                breakpoint: 800, name: DESKTOP, autoScale: false),
          ],
          background: Container(color: background)),
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Visibility(
                visible: false,
                child: ResponsiveWrapper(
                  child: Container(),
                ),
              ),
              ResponsiveWrapper(
                  maxWidth: 1200,
                  minWidth: 1200,
                  defaultScale: true,
                  mediaQueryData: MediaQueryData(size: Size(1200, 640)),
                  child: Carousel()),
              ResponsiveWrapper(maxWidth: 1200, child: GetStarted()),
              ResponsiveWrapper(
                maxWidth: 1200,
                child: Features(),
              ),
              ResponsiveWrapper(
                maxWidth: 1200,
                child: FastDevelopment(),
              ),
              ResponsiveWrapper(
                maxWidth: 1200,
                child: BeautifulUI(),
              ),
              ResponsiveWrapper(
                maxWidth: 1200,
                child: NativePerformance(),
              ),
              ResponsiveWrapper(
                maxWidth: 1200,
                child: LearnFromDevelopers(),
              ),
              ResponsiveWrapper(
                maxWidth: 1200,
                child: WhoUsesFlutter(),
              ),
              ResponsiveWrapper(
                maxWidth: 1200,
                child: FlutterNewsRow(),
              ),
              ResponsiveVisibility(
                hiddenWhen: [Condition.smallerThan(breakpoint: 1000)],
                child: ResponsiveWrapper(
                  maxWidth: 1200,
                  child: FlutterCodelab(),
                ),
              ),
              ResponsiveWrapper(
                maxWidth: 1200,
                child: InstallFlutter(),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
