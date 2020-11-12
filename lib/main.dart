import 'package:flutter/material.dart';
import 'package:flutter_website/ui/block_wrapper.dart';
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
        body: ListView.builder(
            itemCount: blocks.length,
            itemBuilder: (context, index) {
              return blocks[index];
            }),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

List<Widget> blocks = [
  ResponsiveWrapper(
      maxWidth: 1200,
      minWidth: 1200,
      defaultScale: true,
      mediaQueryData: MediaQueryData(size: Size(1200, 640)),
      child: RepaintBoundary(child: Carousel())),
  BlockWrapper(GetStarted()),
  BlockWrapper(Features()),
  BlockWrapper(FastDevelopment()),
  BlockWrapper(BeautifulUI()),
  BlockWrapper(NativePerformance()),
  BlockWrapper(LearnFromDevelopers()),
  BlockWrapper(WhoUsesFlutter()),
  BlockWrapper(FlutterNewsRow()),
  BlockWrapper(InstallFlutter()),
  Footer(),
];

// Disabled codelab block for performance.
//              ResponsiveVisibility(
//                hiddenWhen: [Condition.smallerThan(name: DESKTOP)],
//                child: ResponsiveConstraints(
//                    constraintsWhen: blockWidthConstraints,
//                    child: FlutterCodelab()),
//              ),
