import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_website/components/components.dart';
import 'package:flutter_website/responsive_framework/responsive_framework.dart';

void main() {
  group('ResponsiveValue', () {
    testWidgets('Responsive Widget', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(800, 1280);
      tester.binding.window.devicePixelRatioTestValue = 1;
      Widget widget = MaterialApp(
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
        home: Container(),
      );
      // Build our app and trigger a frame.
      await tester.pumpWidget(widget);
      await tester.pump();
      InheritedResponsiveWrapper inheritedResponsiveWrapper =
          tester.widget(find.byType(InheritedResponsiveWrapper));
      print(inheritedResponsiveWrapper.data);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    testWidgets('ResponsiveVisibility', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(500, 1280);
      tester.binding.window.devicePixelRatioTestValue = 1;
      final testKey = Key('TestKey');
      Widget widget = MaterialApp(
        home: ResponsiveVisibility(
          key: testKey,
          visibleWhen: [
            Condition.smallerThan(breakpoint: 600),
          ],
          hiddenWhen: [
            Condition.smallerThan(breakpoint: 1000),
          ],
          child: Container(),
        ),
      );
      // Build our app and trigger a frame.
      await tester.pumpWidget(widget);
      await tester.pump();
      Visibility visibility = tester.widget(find
          .descendant(
              of: find.byKey(testKey), matching: find.byType(Visibility))
          .first);
      print("Visible: " + visibility.visible.toString());
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    test("Widget", () {
      print("Widget Test");
    });
  });
}
