import 'package:flutter/material.dart';

import 'components.dart';

Widget buildMaterialIconCircle(String imagePath, double size) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: primaryLight,
    ),
    child: Align(
      alignment: Alignment.center,
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
        width: size * 0.5,
        height: size * 0.5,
      ),
    ),
  );
}
