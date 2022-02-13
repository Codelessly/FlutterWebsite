import 'package:flutter/material.dart';
import 'package:flutter_website/components/components.dart';

RichText slide1Text = RichText(
  text: const TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'Design', style: carouselBlueTextStyle),
      TextSpan(text: ' beautiful ', style: carouselWhiteTextStyle),
      TextSpan(text: 'apps', style: carouselBlueTextStyle)
    ],
  ),
  textAlign: TextAlign.center,
);

RichText slide2Text = RichText(
  text: const TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'Productively', style: carouselWhiteTextStyle),
      TextSpan(text: ' build apps', style: carouselBlueTextStyle),
    ],
  ),
  textAlign: TextAlign.center,
);

RichText slide3Text = RichText(
  text: const TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'Create', style: carouselBlueTextStyle),
      TextSpan(text: ' faster ', style: carouselWhiteTextStyle),
      TextSpan(text: 'apps', style: carouselBlueTextStyle)
    ],
  ),
  textAlign: TextAlign.center,
);

RichText slide4Text = RichText(
  text: const TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'Target', style: carouselBlueTextStyle),
      TextSpan(text: ' mobile, web, & desktop ', style: carouselWhiteTextStyle),
      TextSpan(text: 'apps', style: carouselBlueTextStyle)
    ],
    style: TextStyle(height: 1.1),
  ),
  textAlign: TextAlign.center,
);
