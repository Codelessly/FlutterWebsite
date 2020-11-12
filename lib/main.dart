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
        body: buildBody(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget buildBody() {
    return ListView.builder(
      itemBuilder: (context, index) {
        switch(index) {
          case 0: return ResponsiveWrapper(
            maxWidth: 1200,
            minWidth: 1200,
            defaultScale: true,
            mediaQueryData: MediaQueryData(size: Size(1200, 640)),
            child: RepaintBoundary(child: Carousel()));
          case 1: return ResponsiveConstraints(
              constraintsWhen: blockWidthConstraints, child: GetStarted());
          case 2: return ResponsiveConstraints(
            constraintsWhen: blockWidthConstraints, child: Features());
//              ResponsiveVisibility(
//                hiddenWhen: [Condition.smallerThan(name: DESKTOP)],
//                child: ResponsiveConstraints(
//                    constraintsWhen: blockWidthConstraints,
//                    child: FlutterCodelab()),
//              ),
          case 3: return ResponsiveConstraints(
              constraintsWhen: blockWidthConstraints,
              child: FastDevelopment());
          case 4: return ResponsiveConstraints(
              constraintsWhen: blockWidthConstraints, child: BeautifulUI());
          case 5:
            return ResponsiveConstraints(constraintsWhen: blockWidthConstraints,
              child: NativePerformance());
          case 6:
            return ResponsiveConstraints(
                constraintsWhen: blockWidthConstraints,
              child: LearnFromDevelopers());
          case 7:
            return ResponsiveConstraints(
              constraintsWhen: blockWidthConstraints,
              child: WhoUsesFlutter());
          case 8:
            return ResponsiveConstraints(constraintsWhen: blockWidthConstraints,
              child: FlutterNewsRow());
          case 9:
            return ResponsiveConstraints(
              constraintsWhen: blockWidthConstraints,
              child: InstallFlutter());
          case 10:
            return Footer();
          default:
            return Text('');
        }
      },
      itemCount: 11,
    );
  }
}
