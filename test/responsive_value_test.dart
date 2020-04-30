//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:flutter_website/components/components.dart';
//import 'package:responsive_framework/responsive_framework.dart';
//
//void main() {
//  group('ResponsiveValue', () {
//    testWidgets('Responsive Widget', (WidgetTester tester) async {
//      tester.binding.window.physicalSizeTestValue = Size(800, 1280);
//      tester.binding.window.devicePixelRatioTestValue = 1;
//      Widget widget = MaterialApp(
//        builder: (context, widget) => ResponsiveWrapper.builder(
//            BouncingScrollWrapper.builder(context, widget),
//            maxWidth: 1200,
//            minWidth: 450,
//            defaultScale: true,
//            breakpoints: [
//              ResponsiveBreakpoint(breakpoint: 450, name: MOBILE),
//              ResponsiveBreakpoint(breakpoint: 800, name: DESKTOP),
//            ],
//            background: Container(color: background)),
//        home: Container(),
//      );
//      // Build our app and trigger a frame.
//      await tester.pumpWidget(widget);
//      await tester.pump();
//      InheritedResponsiveWrapper inheritedResponsiveWrapper =
//          tester.widget(find.byType(InheritedResponsiveWrapper));
//
//      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
//    });
//
//    testWidgets('ResponsiveVisibility', (WidgetTester tester) async {
//      tester.binding.window.physicalSizeTestValue = Size(500, 1280);
//      tester.binding.window.devicePixelRatioTestValue = 1;
//      final testKey = Key('TestKey');
//      Widget widget = MaterialApp(
//        home: ResponsiveVisibility(
//          key: testKey,
//          visibleWhen: [
//            Condition.smallerThan(breakpoint: 600),
//          ],
//          hiddenWhen: [
//            Condition.smallerThan(breakpoint: 1000),
//          ],
//          child: Container(),
//        ),
//      );
//      // Build our app and trigger a frame.
//      await tester.pumpWidget(widget);
//      await tester.pump();
//      Visibility visibility = tester.widget(find
//          .descendant(
//              of: find.byKey(testKey), matching: find.byType(Visibility))
//          .first);
//      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
//    });
//
//    test('Widget', () {
//      print('Widget Test');
//    });
//  });
//
//  group('ResponsiveVisibility', () {
//    group('Named', () {
//      group('Single', () {
//        testWidgets('Equals', (WidgetTester tester) async {
//          setScreenSize(tester, Size(450, 1200));
//          final key = Key('TestKey');
//          Widget widget = buildTestResponsiveWrapper(ResponsiveVisibility(
//            key: key,
//            hiddenWhen: [
//              Condition.equals(MOBILE),
//            ],
//            child: Container(),
//          ));
//          await tester.pumpWidget(widget);
//          await tester.pump();
//          await tester.pumpAndSettle();
//          dynamic responsiveVisibilityState = tester.state(find.byKey(key));
//          Visibility visibility = tester.widget(find
//              .descendant(
//                  of: find.byKey(key), matching: find.byType(Visibility))
//              .first);
//          expect(responsiveVisibilityState.activeCondition?.name, MOBILE);
//          expect(visibility.visible, false);
//          resetScreenSize(tester);
//        });
//
//        testWidgets('Smaller Than', (WidgetTester tester) async {
//          setScreenSize(tester, Size(400, 1200));
//          final key = Key('TestKey');
//          Widget widget = buildTestResponsiveWrapper(ResponsiveVisibility(
//            key: key,
//            hiddenWhen: [
//              Condition.equals(MOBILE),
//            ],
//            child: Container(),
//          ));
//          await tester.pumpWidget(widget);
//          await tester.pump();
//          await tester.pumpAndSettle();
//          dynamic responsiveVisibilityState = tester.state(find.byKey(key));
//          Visibility visibility = tester.widget(find
//              .descendant(
//                  of: find.byKey(key), matching: find.byType(Visibility))
//              .first);
//          expect(responsiveVisibilityState.activeCondition?.name, null);
//          expect(visibility.visible, true);
//        });
//
//        testWidgets('Larger Than', (WidgetTester tester) async {
//          setScreenSize(tester, Size(600, 1200));
//          final key = Key('TestKey');
//          Widget widget = buildTestResponsiveWrapper(ResponsiveVisibility(
//            key: key,
//            hiddenWhen: [
//              Condition.equals(MOBILE),
//            ],
//            child: Container(),
//          ));
//          await tester.pumpWidget(widget);
//          await tester.pump();
//          await tester.pumpAndSettle();
//          dynamic responsiveVisibilityState = tester.state(find.byKey(key));
//          Visibility visibility = tester.widget(find
//              .descendant(
//                  of: find.byKey(key), matching: find.byType(Visibility))
//              .first);
//          expect(responsiveVisibilityState.activeCondition?.name, null);
//          expect(visibility.visible, true);
//        });
//
//        testWidgets('Smaller Default Name', (WidgetTester tester) async {
//          setScreenSize(tester, Size(600, 1200));
//          final key = Key('TestKey');
//          Widget widget = MaterialApp(
//            builder: (context, widget) => ResponsiveWrapper.builder(widget,
//                maxWidth: 1200,
//                minWidth: 450,
//                defaultScale: true,
//                defaultName: MOBILE,
//                breakpoints: [],
//                background: Container(color: background)),
//            home: ResponsiveVisibility(
//              key: key,
//              hiddenWhen: [
//                Condition.equals(MOBILE),
//              ],
//              child: Container(),
//            ),
//          );
//          await tester.pumpWidget(widget);
//          await tester.pump();
//          await tester.pumpAndSettle();
//          dynamic responsiveVisibilityState = tester.state(find.byKey(key));
//          Visibility visibility = tester.widget(find
//              .descendant(
//                  of: find.byKey(key), matching: find.byType(Visibility))
//              .first);
//          expect(responsiveVisibilityState.activeCondition?.name, MOBILE);
//          expect(visibility.visible, false);
//        });
//      });
//    });
//
//    group('Breakpoint', () {
//      testWidgets('Smaller Than Single', (WidgetTester tester) async {
//        tester.binding.window.physicalSizeTestValue = Size(600, 1200);
//        tester.binding.window.devicePixelRatioTestValue = 1;
//        final testKey = Key('TestKey');
//        Widget widget = MaterialApp(
//          home: ResponsiveVisibility(
//            key: testKey,
//            hiddenWhen: [
//              Condition.smallerThan(breakpoint: 800),
//            ],
//            child: Container(),
//          ),
//        );
//        // Build our app and trigger a frame.
//        await tester.pumpWidget(widget);
//        await tester.pump();
//        Visibility visibility = tester.widget(find
//            .descendant(
//                of: find.byKey(testKey), matching: find.byType(Visibility))
//            .first);
//        addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
//        tester.binding.window.physicalSizeTestValue = Size(1000, 1200);
//        await tester.pumpAndSettle();
//        visibility = tester.widget(find
//            .descendant(
//                of: find.byKey(testKey), matching: find.byType(Visibility))
//            .first);
//      });
//    });
//  });
//}
//
//Widget buildTestResponsiveWrapper(Widget child) {
//  return MaterialApp(
//    builder: (context, widget) => ResponsiveWrapper.builder(widget,
//        maxWidth: 1200,
//        minWidth: 450,
//        defaultScale: true,
//        breakpoints: [
//          ResponsiveBreakpoint(breakpoint: 450, name: MOBILE),
//          ResponsiveBreakpoint(breakpoint: 600, name: TABLET, autoScale: true),
//          ResponsiveBreakpoint(breakpoint: 800, name: DESKTOP),
//        ],
//        background: Container(color: background)),
//    home: child,
//  );
//}
//
//void setScreenSize(WidgetTester tester, Size size) {
//  tester.binding.window.physicalSizeTestValue = size;
//  tester.binding.window.devicePixelRatioTestValue = 1;
//}
//
//void resetScreenSize(WidgetTester tester) {
//  addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
//}
