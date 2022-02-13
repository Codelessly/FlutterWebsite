![Screenshots](screenshots/Flutter%20Website%20Home.png)
# [Flutter.dev Website - Recreated in Flutter](https://gallery.codelessly.com/flutterwebsites/flutterwebsite)
[![Flutter Responsive](https://img.shields.io/badge/flutter-responsive-brightgreen.svg?style=flat-square)](https://github.com/Codelessly/ResponsiveFramework) [![GitHub release](https://img.shields.io/github/release/Codelessly/FlutterWebsite.svg?style=flat-square)](https://github.com/Codelessly/FlutterWebsite/releases) [![GitHub Release Date](https://img.shields.io/github/release-date/Codelessly/FlutterWebsite.svg?style=flat-square)](https://github.com/Codelessly/FlutterWebsite/releases) [![GitHub issues](https://img.shields.io/github/issues/Codelessly/FlutterWebsite.svg?style=flat-square)](https://github.com/Codelessly/FlutterWebsite/issues) [![GitHub top language](https://img.shields.io/github/languages/top/Codelessly/FlutterWebsite.svg?style=flat-square)](https://github.com/Codelessly/FlutterWebsite) [![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/Codelessly/FlutterWebsite.svg?style=flat-square)](https://github.com/Codelessly/FlutterWebsite) [![Libraries.io for GitHub](https://img.shields.io/librariesio/github/Codelessly/FlutterWebsite.svg?style=flat-square)](https://libraries.io/github/Codelessly/FlutterWebsite) [![License](https://img.shields.io/badge/License-BSD%200--Clause-orange.svg?style=flat-square)](https://opensource.org/licenses/0BSD)

<img src="web/icons/Icon-192.png" width="128">

> ### The flutter.dev website, now in Flutter!

[View Flutter Website](https://gallery.codelessly.com/flutterwebsites/flutterwebsite)

[Canvas Version](https://gallery.codelessly.com/flutterwebsites/flutterwebsite-canvas)

## Screenshots

|Desktop|Tablet|Mobile| 
|--|--|--|
|![Screenshots](screenshots/Flutter%20Website%20Desktop.png)|![Screenshots](screenshots/Flutter%20Website%20Tablet.png)|![Screenshots](screenshots/Flutter%20Website%20Mobile.png)|

## About

This template was created for a [Flutter Week](https://flutter-week.com) presentation about building responsive websites with the [Flutter Responsive Framework](https://github.com/Codelessly/ResponsiveFramework).

If you like this project or it helped you, please leave your email for updates. Although it is not required, I'd very much appreciate it!

<a href="https://codelessly.com/?utm_medium=banner&utm_campaign=newsletter_subscribe" target="_blank"><img src="https://raw.githubusercontent.com/Codelessly/ResponsiveFramework/master/packages/Email%20Newsletter%20Signup.png"></a>

## Video

Build Responsive Flutter Websites Easily - Flutter Week Presentation

<a href="https://youtu.be/7Zql2rvYRLE" target="_blank"><img src="screenshots/Flutter%20Week%20Video%20Thumbnail.png" width="600" height="auto"></a>

[29:45](https://youtu.be/7Zql2rvYRLE?t=1785) - recreating the Flutter website in Flutter.

## Components

Select components with development commentary and Responsive Framework usage walkthrough.

### Animated Carousel

![Screenshots](screenshots/Flutter%20Website%20Animated%20Carousel.png)
    
The animated carousel component is eye-catching and beautiful. Fortunately, creating it in Flutter is very easy. All we need is to first create an animation scaffold!

The animation can be broken down into `carousel`, `slide`, `element`, and `animation` components. Each component is a layer in our animation scaffold with its own responsibilities and logic.

- `carousel` - There are 4 carousel slides. Each slide is displayed for approximately 6400 milliseconds. The responsibility of the carousel is to hold child slides and coordinate their transitions.

        carousel
        
- `slide` - Each slide contains images and text that appear and disappear with entrance and exit animations. The responsibility of the slide is to position its child elements and coordinate their animations.

        carousel_slide_1
        carousel_slide_2
        carousel_slide_3
        carousel_slide_4
        model_carousel_item_animation

- `element` - Elements are the content of the slides. Elements are plain widgets that do not know how they will be animated. Their only requirement is to support being animated. The animation logic is abstracted to a separate layer. 
        
        carousel_text
        Image
        
- `animation` - Animation behaviors. Animations expose an interface that animators such as our slide can use to control the animation state.

        animation_slide_up_down_fade

With the animation scaffold created, creating the animation itself is very easy.

1. Create a slide.
2. Add slide elements.
3. Apply animations to slide elements.
4. Coordinate element entry and exits. 
5. Add slide to carousel.

Finally, the entire animation is wrapped in a `ResponsiveWrapper` and given a reference `MediaQuery` width and height. This allows the carousel to display correctly at any screen size.

```dart
  ResponsiveWrapper(
      maxWidth: 1200,
      minWidth: 1200,
      defaultScale: true,
      mediaQueryData: MediaQueryData(size: Size(1200, 640)),
      child: Carousel()
    )
```

The animation scaffold was constructed based on a timeline animation model. All animation durations are relative which allows for easy customization and adjustments in the future. Hopefully one day, someone will create a drag and drop animation editor for Flutter that will generate all the code automatically.

### Features

![Screenshots](screenshots/Flutter%20Website%20Features.png)

The Features section is a simple row with Feature components. That is until the layout narrows and there is not enough room for a row. Then it needs to become a column!

`ResponsiveRowColumn` helps transition between row and column layouts at different screen sizes. When `rowColumn` is true, the layout is a row. When `rowColumn` is false, the layout is a column.

```dart
ResponsiveRowColumn(
        rowColumn: !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP),
        children: [
          ResponsiveRowColumnItem(
            child: Feature()
            )
        ]
    )
```

### Feature Detail

![Screenshots](screenshots/Flutter%20Website%20Feature%20Detail.png)

The Feature Detail component has two rows of content, each with a different width percentage. The balance here is 7:5 with the graphic taking up slightly more space than the text. This behavior can be created by setting a flex value for each row. However, the flex needs to be removed when the layout is in column mode to avoid invalid constraints errors. 

`ResponsiveRowColumnItem` is used to wrap children in a `Flexible` widget when in a row or column layout. When `rowFlex` is set, the child will be wrapped in a `Flexible` with a flex value of 5. Likewise, `columnFlex` provides the same behavior for column layouts. Layouts are inherited from the parent `ResponsiveRowColumn`'s `isRowColumn` value.

```dart
ResponsiveRowColumnItem(
        rowFlex: 5,
        columnOrder: 1,
        child: FeatureDetail(),
    )
```

Another responsiveness challenge is item ordering. To control the specific order of items in a row or column layout, set a `rowOrder` or `columnOrder`.

### Flutter in Flutter

![Screenshots](screenshots/Flutter%20Website%20Flutter%20Embed.png)

Amazing, FLutter inside of Flutter! It works.. sort of. Embedded iframes in Flutter Web has some issues.

## Final Thoughts

Flutter Web is phenomenal and it was really fun to solve some of the basic essential problems of responsiveness on the web. Despite all the years I've been doing web development, this template is the most "perfect" website I've ever created. Thanks to power of the underlying framework, I know precisely how the layout looks at every size.

Flutter Web is revolutionary but there is still much work to do. In some areas, Flutter is already ahead but in others, the ecosystem is literally years behind. For the challenges ahead, let's tackle them together head-on and solve the core problems.

Building this Flutter website also exposed a few pain points. Please let me know if you're working on or are interested in tackling one of the items below.

- Animation editor.
- RichText generator.
- A Flutter analytics framework.

## Acknowledgements ❤️

**Inspiration:** 

<a href="https://flutter-week.com/?utm_medium=logo&utm_campaign=responsive_framework">
  <img alt="Flutter"
       src="screenshots/Flutter%20Week%20Logo.png" />
</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://flutter.dev">
  <img alt="Flutter"
       src="https://raw.githubusercontent.com/Codelessly/ResponsiveFramework/master/packages/Flutter%20Logo%20Banner.png" />
</a>

**Development:** 
* [Ray Li](https://github.com/searchy2)

**Sponsor:** [Codelessly - Flutter App UI and Website Builder](https://codelessly.com/?utm_medium=link&utm_campaign=direct)

<a href="mailto:ray@codelessly.com">
  <img alt="Codelessly Email"
       src="https://lh3.googleusercontent.com/yN_m90WN_HSCohXdgC2k91uSTk9dnYfoxTYwG_mv_l5_05dV2CzkQ1B6rEqH4uqdgjA=w96" />
</a>
<a href="https://codelessly.com/?utm_medium=icon&utm_campaign=direct">
  <img alt="Codelessly Website"
       src="https://lh3.googleusercontent.com/YmMGcgeO7Km9-J9vFRByov5sb7OUKetnKs8pTi0JZMDj3GVJ61GMTcTlHB7u9uHDHag=w96" />
</a>
<a href="https://twitter.com/BuildCodelessly">
  <img alt="Codelessly Twitter"
       src="https://lh3.ggpht.com/lSLM0xhCA1RZOwaQcjhlwmsvaIQYaP3c5qbDKCgLALhydrgExnaSKZdGa8S3YtRuVA=w96" />
</a>
<a href="https://github.com/Codelessly">
  <img alt="Codelessly GitHub"
       src="https://lh3.googleusercontent.com/L15QqmKK7Vl-Ag1ZxaBqNQlXVEw58JT2BDb-ef5t2eboDh0pPSLjDgi3-aQ3Opdhhyk=w96" />
</a>
<br></br>
<a href="https://github.com/Codelessly/ResponsiveFramework">
  <img alt="Built with Responsive Framework"
       src="https://raw.githubusercontent.com/Codelessly/ResponsiveFramework/master/packages/Built%20with%20Responsive%20Badge.png" />
</a>


## License
### Website Template

    BSD Zero Clause License

    Copyright © 2020 Codelessly

    Permission to use, copy, modify, and/or distribute this software for any
    purpose with or without fee is hereby granted.

    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
    REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
    AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
    INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
    LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
    OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
    PERFORMANCE OF THIS SOFTWARE.

### Flutter.dev

    Except as otherwise noted, the content of this repository is licensed under the
    Creative Commons Attribution 3.0 License [1], and code samples are licensed
    under the BSD License:

    Copyright 2012, the project authors. All rights reserved. Redistribution and use
    in source and binary forms, with or without modification, are permitted provided
    that the following conditions are met:

        * Redistributions of source code must retain the above copyright
          notice, this list of conditions and the following disclaimer.
        * Redistributions in binary form must reproduce the above
          copyright notice, this list of conditions and the following
          disclaimer in the documentation and/or other materials provided
          with the distribution.
        * Neither the name of Google Inc. nor the names of its
          contributors may be used to endorse or promote products derived
          from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
    A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
    OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

    [1] http://creativecommons.org/licenses/by/3.0/
