import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

// Margin
const EdgeInsets marginBottom12 = EdgeInsets.only(bottom: 12);
const EdgeInsets marginBottom24 = EdgeInsets.only(bottom: 24);
const EdgeInsets marginBottom40 = EdgeInsets.only(bottom: 40);

// Padding
const EdgeInsets paddingBottom24 = EdgeInsets.only(bottom: 24);

// Block Spacing
const List<Condition> blockWidthConstraints = [
  Condition.equals(name: MOBILE, value: BoxConstraints(maxWidth: 600)),
  Condition.equals(name: TABLET, value: BoxConstraints(maxWidth: 700)),
  Condition.largerThan(name: TABLET, value: BoxConstraints(maxWidth: 1280)),
];

EdgeInsets blockPadding(BuildContext context) => ResponsiveValue(context,
        defaultValue: const EdgeInsets.symmetric(horizontal: 55, vertical: 80),
        valueWhen: [
          const Condition.smallerThan(
              name: TABLET,
              value: EdgeInsets.symmetric(horizontal: 15, vertical: 45))
        ]).value!;

const EdgeInsets blockMargin = EdgeInsets.fromLTRB(10, 0, 10, 32);
