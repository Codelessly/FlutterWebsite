import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_website/components/colors.dart';
import 'package:flutter_website/ui/block_wrapper.dart';
import 'package:flutter_website/ui/carousel/carousel.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:universal_io/io.dart';

import 'ui/blocks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveBreakpoints.builder(
        child: Builder(builder: (context) {
          return ResponsiveScaledBox(
              width: ResponsiveValue<double?>(context,
                  defaultValue: null,
                  conditionalValues: [
                    const Condition.equals(name: 'MOBILE_SMALL', value: 480),
                  ]).value,
              child: ClampingScrollWrapper.builder(context, widget!));
        }),
        breakpoints: [
          const Breakpoint(start: 0, end: 480, name: 'MOBILE_SMALL'),
          const Breakpoint(start: 481, end: 850, name: MOBILE),
          const Breakpoint(start: 850, end: 1080, name: TABLET),
          const Breakpoint(start: 1081, end: double.infinity, name: DESKTOP),
        ],
      ),
      home: Scaffold(
        backgroundColor: background,
        appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 66), child: WebsiteMenuBar()),
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
  MaxWidthBox(
    maxWidth: 1200,
    child: FittedBox(
      fit: BoxFit.fitWidth,
      alignment: Alignment.topCenter,
      child: Container(
          width: 1200,
          height: 640,
          alignment: Alignment.center,
          child: RepaintBoundary(child: Carousel())),
    ),
  ),
  const BlockWrapper(GetStarted()),
  const BlockWrapper(Features()),
  const BlockWrapper(FastDevelopment()),
  const BlockWrapper(BeautifulUI()),
  const BlockWrapper(NativePerformance()),
  const BlockWrapper(LearnFromDevelopers()),
  const BlockWrapper(WhoUsesFlutter()),
  // Disabled codelab block for performance.
  if (kIsWeb || Platform.isAndroid || Platform.isIOS)
    const ResponsiveVisibility(
      hiddenConditions: [Condition.smallerThan(name: DESKTOP)],
      child: BlockWrapper(FlutterCodelab()),
    ),
  const BlockWrapper(FlutterNewsRow()),
  const BlockWrapper(InstallFlutter()),
  const Footer(),
];
