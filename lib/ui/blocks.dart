import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_website/components/components.dart';
import 'package:flutter_website/responsive_framework/responsive_framework.dart';
import 'package:flutter_website/utils/utils.dart';
import 'package:universal_html/html.dart' as html;
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: EdgeInsets.fromLTRB(1, 0, 1, 32),
      padding: EdgeInsets.all(40),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          constraints: BoxConstraints.loose(Size(800, double.infinity)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Made by ",
                      style: headlineSecondaryTextStyle.copyWith(fontSize: 24)),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Image.asset("assets/images/google_logo.png",
                        width: 75, height: 24, fit: BoxFit.fill),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text:
                              "Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for ",
                          style: headlineSecondaryTextStyle),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openUrl("https://flutter.dev/docs");
                            },
                          text: "mobile",
                          style: headlineSecondaryTextStyle.copyWith(
                              color: primary)),
                      TextSpan(text: ", ", style: headlineSecondaryTextStyle),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openUrl("https://flutter.dev/web");
                            },
                          text: "web",
                          style: headlineSecondaryTextStyle.copyWith(
                              color: primary)),
                      TextSpan(
                          text: ", and ", style: headlineSecondaryTextStyle),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openUrl("https://flutter.dev/desktop");
                            },
                          text: "desktop",
                          style: headlineSecondaryTextStyle.copyWith(
                              color: primary)),
                      TextSpan(
                          text: " from a single codebase.",
                          style: headlineSecondaryTextStyle),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: ResponsiveRowColumn(
                  isColumn: ResponsiveWrapper.of(context).isMobile,
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  rowCrossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () => openUrl(
                          "https://flutter.dev/docs/get-started/install"),
                      color: primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0))),
                      padding:
                          EdgeInsets.symmetric(vertical: 22, horizontal: 80),
                      child: Text(
                        "Get started",
                        style: buttonTextStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: FlatButton(
                        onPressed: () => {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Icon(
                                Icons.play_circle_filled,
                                size: 24,
                                color: primary,
                              ),
                            ),
                            Text(
                              "Watch video",
                              style: buttonTextStyle.copyWith(
                                  fontSize: 16, color: primary),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Coming from another platform? Docs: ",
                        style: bodyTextStyle),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            openUrl(
                                "https://flutter.dev/docs/get-started/flutter-for/ios-devs");
                          },
                        text: "iOS",
                        style: bodyLinkTextStyle),
                    TextSpan(text: ", ", style: bodyTextStyle),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            openUrl(
                                "https://flutter.dev/docs/get-started/flutter-for/android-devs");
                          },
                        text: "Android",
                        style: bodyLinkTextStyle),
                    TextSpan(text: ", ", style: bodyTextStyle),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            openUrl(
                                "https://flutter.dev/docs/get-started/flutter-for/web-devs");
                          },
                        text: "Web",
                        style: bodyLinkTextStyle),
                    TextSpan(text: ", ", style: bodyTextStyle),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            openUrl(
                                "https://flutter.dev/docs/get-started/flutter-for/react-native-devs");
                          },
                        text: "React Native",
                        style: bodyLinkTextStyle),
                    TextSpan(text: ", ", style: bodyTextStyle),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            openUrl(
                                "https://flutter.dev/docs/get-started/flutter-for/xamarin-forms-devs");
                          },
                        text: "Xamarin",
                        style: bodyLinkTextStyle),
                    TextSpan(text: ".", style: bodyTextStyle),
                  ]),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Features extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: EdgeInsets.fromLTRB(1, 0, 1, 32),
      padding: EdgeInsets.all(40),
      child: ResponsiveRowColumn(
        isColumn: ResponsiveWrapper.of(context).isMobile,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        columnMainAxisSize: MainAxisSize.min,
        columnSpacing: EdgeInsets.only(bottom: 48),
        fillRow: true,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child:
                      getMaterialIcon("assets/images/icon_development.png", 68),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("Fast Development",
                      style: headlineSecondaryTextStyle,
                      textAlign: TextAlign.center),
                ),
                Text(
                    "Paint your app to life in milliseconds with Stateful Hot Reload. Use a rich set of fully-customizable widgets to build native interfaces in minutes.",
                    style: bodyTextStyle,
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: getMaterialIcon("assets/images/icon_ui.png", 68),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("Expressive and Flexible UI",
                      style: headlineSecondaryTextStyle,
                      textAlign: TextAlign.center),
                ),
                Text(
                    "Quickly ship features with a focus on native end-user experiences. Layered architecture allows for full customization, which results in incredibly fast rendering and expressive and flexible designs.",
                    style: bodyTextStyle,
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child:
                      getMaterialIcon("assets/images/icon_performance.png", 68),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("Native Performance",
                      style: headlineSecondaryTextStyle,
                      textAlign: TextAlign.center),
                ),
                RichText(
                  text: TextSpan(
                    style: bodyTextStyle,
                    children: [
                      TextSpan(
                          text:
                              "Flutter’s widgets incorporate all critical platform differences such as scrolling, navigation, icons and fonts, and your Flutter code is compiled to native ARM machine code using "),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              openUrl("https://dart.dev/platforms");
                            },
                          text: "Dart's native compilers",
                          style: bodyLinkTextStyle),
                      TextSpan(
                          text:
                              ". Thus Flutter gives you full native performance on both iOS and Android."),
                    ],
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FastDevelopment extends StatefulWidget {
  @override
  _FastDevelopmentState createState() => _FastDevelopmentState();
}

class _FastDevelopmentState extends State<FastDevelopment> {
  VideoPlayerController videoController;
  Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    videoController = VideoPlayerController.asset("assets/videos/FastDev.mp4");
    videoController.setVolume(0);
    videoController.setLooping(true);
    initializeVideoPlayerFuture = videoController.initialize().then((_) {
      // Display the first frame of the video before playback.
      setState(() {});
      videoPlay();
    });
    super.initState();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  void videoPlay() {
    videoController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: EdgeInsets.fromLTRB(1, 0, 1, 32),
      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: FutureBuilder(
              future: initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the VideoPlayer.
                  return AspectRatio(
                    aspectRatio: videoController.value.aspectRatio,
                    child: VideoPlayer(videoController),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return Container();
                }
              },
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 32, 25, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: getMaterialIcon(
                        "assets/images/icon_development.png", 68),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Text("Fast Development", style: headlineTextStyle),
                  ),
                  RichText(
                    text: TextSpan(
                      style: bodyTextStyle,
                      children: [
                        TextSpan(text: "Flutter's "),
                        TextSpan(
                            text: "hot reload",
                            style: bodyTextStyle.copyWith(
                                fontStyle: FontStyle.italic)),
                        TextSpan(
                            text:
                                " helps you quickly and easily experiment, build UIs, add features, and fix bugs faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android."),
                        TextSpan(text: "\n\n"),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openUrl(
                                    "https://flutter.dev/docs/development/tools/hot-reload");
                              },
                            text: "Learn more",
                            style: bodyLinkTextStyle)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BeautifulUI extends StatefulWidget {
  @override
  _BeautifulUIState createState() => _BeautifulUIState();
}

class _BeautifulUIState extends State<BeautifulUI> {
  VideoPlayerController videoController;
  Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    videoController =
        VideoPlayerController.asset("assets/videos/BeautifulUI.mp4");
    videoController.setVolume(0);
    videoController.setLooping(true);
    initializeVideoPlayerFuture = videoController.initialize().then((_) {
      // Display the first frame of the video before playback.
      setState(() {});
      videoPlay();
    });
    super.initState();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  void videoPlay() {
    videoController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: EdgeInsets.fromLTRB(1, 0, 1, 32),
      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 32, 25, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: getMaterialIcon("assets/images/icon_ui.png", 68),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Text("Expressive, beautiful UIs",
                        style: headlineTextStyle),
                  ),
                  RichText(
                    text: TextSpan(
                      style: bodyTextStyle,
                      children: [
                        TextSpan(
                            text:
                                "Delight your users with Flutter's built-in beautiful Material Design and Cupertino (iOS-flavor) widgets, rich motion APIs, smooth natural scrolling, and platform awareness."),
                        TextSpan(text: "\n\n"),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openUrl(
                                    "https://flutter.dev/docs/development/ui/widgets/catalog");
                              },
                            text: "Browse the widget catalog",
                            style: bodyLinkTextStyle),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: FutureBuilder(
              future: initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the VideoPlayer.
                  return AspectRatio(
                    aspectRatio: videoController.value.aspectRatio,
                    child: VideoPlayer(videoController),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NativePerformance extends StatefulWidget {
  @override
  _NativePerformanceState createState() => _NativePerformanceState();
}

class _NativePerformanceState extends State<NativePerformance> {
  VideoPlayerController videoController;
  Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    videoController =
        VideoPlayerController.asset("assets/videos/NativePerformance.mp4");
    videoController.setVolume(0);
    videoController.setLooping(true);
    initializeVideoPlayerFuture = videoController.initialize().then((_) {
      // Display the first frame of the video before playback.
      setState(() {});
      videoPlay();
    });
    super.initState();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  void videoPlay() {
    videoController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: EdgeInsets.fromLTRB(1, 0, 1, 32),
      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: FutureBuilder(
              future: initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the VideoPlayer.
                  return AspectRatio(
                    aspectRatio: videoController.value.aspectRatio,
                    child: VideoPlayer(videoController),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return Container();
                }
              },
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 32, 25, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: getMaterialIcon(
                        "assets/images/icon_performance.png", 68),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Text("Native Performance", style: headlineTextStyle),
                  ),
                  RichText(
                    text: TextSpan(
                      style: bodyTextStyle,
                      children: [
                        TextSpan(
                            text:
                                "Flutter’s widgets incorporate all critical platform differences such as scrolling, navigation, icons and fonts to provide full native performance on both iOS and Android."),
                        TextSpan(text: "\n\n"),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openUrl("https://flutter.dev/showcase");
                              },
                            text: "Examples of apps built with Flutter",
                            style: bodyLinkTextStyle),
                        TextSpan(text: "\n\n"),
                        TextSpan(
                            text: "Demo design inspired by ",
                            style: bodyTextStyle.copyWith(fontSize: 12)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openUrl("https://dribbble.com/aureliensalomon");
                              },
                            text: "Aurélien Salomon",
                            style: bodyTextStyle.copyWith(
                                fontSize: 12, color: primary)),
                        TextSpan(
                            text: "'s ",
                            style: bodyTextStyle.copyWith(fontSize: 12)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openUrl(
                                    "https://dribbble.com/shots/2940231-Google-Newsstand-Navigation-Pattern");
                              },
                            text: "Google Newsstand Navigation Pattern",
                            style: bodyTextStyle.copyWith(
                                fontSize: 12, color: primary)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LearnFromDevelopers extends StatefulWidget {
  @override
  _LearnFromDevelopersState createState() => _LearnFromDevelopersState();
}

class _LearnFromDevelopersState extends State<LearnFromDevelopers> {
  final String videoUrl = "https://www.youtube.com/embed/W1pNjxmNHNQ";
  final double videoAspectRatio = 1.78;
  UniqueKey webViewKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    webViewKey = UniqueKey();
    // TODO: Breaks mobile builds. Official Flutter WebView plugin is working on Web support.
    // TODO: Resets iframe on scroll. Wait for official Flutter fix.
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        webViewKey.toString(),
        (viewId) => html.IFrameElement()
          ..width = "1080"
          ..height = "606"
          ..src = videoUrl
          ..style.border = "none");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: EdgeInsets.fromLTRB(1, 0, 1, 32),
      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 32, 25, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child:
                        Text("Learn from developers", style: headlineTextStyle),
                  ),
                  RichText(
                    text: TextSpan(
                      style: bodyTextStyle,
                      children: [
                        TextSpan(
                            text:
                                "Watch these videos to learn from Google and developers as you build with Flutter."),
                        TextSpan(text: "\n\n"),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openUrl("https://www.youtube.com/flutterdev");
                              },
                            text: "Visit our YouTube playlist",
                            style: bodyLinkTextStyle),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: AspectRatio(
                aspectRatio: videoAspectRatio,
                child: (kIsWeb)
                    ? Image.asset(
                        "assets/images/video_thumbnail_learn_from_developers.png",
                        fit: BoxFit.contain)
                    // TODO: Multiple embedded iframes flicker.
//                HtmlElementView(
//                        key: webViewKey,
//                        viewType: webViewKey.toString(),
//                      )
                    : WebView(
                        key: webViewKey,
                        initialUrl: videoUrl,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WhoUsesFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: EdgeInsets.fromLTRB(1, 0, 1, 32),
      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 32, 25, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child:
                        Text("Who's using Flutter?", style: headlineTextStyle),
                  ),
                  RichText(
                    text: TextSpan(
                      style: bodyTextStyle,
                      children: [
                        TextSpan(
                            text:
                                "Organizations around the world are building apps with Flutter."),
                        TextSpan(text: "\n\n"),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openUrl("https://flutter.dev/showcase");
                              },
                            text: "See what’s being created",
                            style: bodyLinkTextStyle),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
              flex: 7,
              child: Image.asset("assets/images/companies_using_flutter.png",
                  fit: BoxFit.contain)),
        ],
      ),
    );
  }
}

class FlutterNewsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: FlutterNews(
              title: "Announcing Flutter 1.12",
              imagePath: "assets/images/news_flutter_1.12.png",
              linkUrl:
                  "https://developers.googleblog.com/2019/12/flutter-ui-ambient-computing.html",
            ),
          ),
          Container(width: 25),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: FlutterNews(
              title: "Flutter’s iOS Application Bundle",
              imagePath:
                  "assets/images/news_flutter_ios_application_bundle.png",
              linkUrl:
                  "https://medium.com/flutter/flutters-ios-application-bundle-6f56d4e88cf8",
            ),
          ),
        ],
      ),
    );
  }
}

class FlutterNews extends StatelessWidget {
  final String title;
  final String imagePath;
  final String linkUrl;

  const FlutterNews(
      {Key key,
      @required this.title,
      @required this.imagePath,
      @required this.linkUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints.tightForFinite(width: double.infinity, height: 530),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: EdgeInsets.fromLTRB(1, 0, 1, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            constraints: BoxConstraints.loose(Size(
              double.infinity,
              340,
            )),
            child: Image.asset(imagePath, fit: BoxFit.fitWidth),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("News",
                      style: bodyTextStyle.copyWith(
                          fontSize: 12, color: Color(0xFF6C757D))),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(title, style: headlineSecondaryTextStyle),
                ),
                GestureDetector(
                  onTap: () => openUrl(linkUrl),
                  child: Text("Read More", style: bodyLinkTextStyle),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FlutterCodelab extends StatefulWidget {
  @override
  _FlutterCodelabState createState() => _FlutterCodelabState();
}

class _FlutterCodelabState extends State<FlutterCodelab> {
  static List<String> codelabIds = ["Spinning Flutter", "Fibonacci", "Counter"];
  static List<String> codelabUrls = [
    "https://dartpad.dev/embed-flutter.html?id=c0450ca427127acfb710a31c99761f1a",
    "https://dartpad.dev/embed-flutter.html?id=38311b87e4b3c76329812077c82323b4",
    "https://dartpad.dev/embed-flutter.html?id=7b5710b344431457753253625a596158"
  ];
  String codelabSelected = codelabIds[0];
  String codelabUrlSelected = codelabUrls[0];
  final double videoAspectRatio = 1.75;

  Map<String, Widget> codelabExamples;
  // TODO: Breaks mobile builds. Official Flutter WebView plugin is working on Web support.
  HtmlElementView codelabHtmlElementView;
  UniqueKey webViewKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    codelabExamples = <String, Widget>{
      codelabIds[0]: getCupertinoSelectionWidget(codelabIds[0]),
      codelabIds[1]: getCupertinoSelectionWidget(codelabIds[1]),
      codelabIds[2]: getCupertinoSelectionWidget(codelabIds[2]),
    };
    setCodelabHtmlElementView();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: true,
      hiddenWhen: [
        Condition.equals(MOBILE),
        Condition.smallerThan(name: MOBILE),
      ],
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: border)),
        margin: EdgeInsets.fromLTRB(1, 0, 1, 32),
        padding: EdgeInsets.all(80),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            constraints: BoxConstraints.loose(Size(1000, double.infinity)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("Try Flutter in your browser",
                      style: headlineTextStyle),
                ),
                CupertinoSlidingSegmentedControl(
                  groupValue: codelabSelected,
                  onValueChanged: (value) => setCodelabSelected(value),
                  children: codelabExamples,
                ),
// TODO: Dropdown overlay's hit area covered by iframe. Unable to select item.
//              Container(
//                decoration: BoxDecoration(
//                  border: Border.all(color: Color(0xFFA9A9A9), width: 1),
//                  borderRadius: BorderRadius.all(Radius.circular(0)),
//                ),
//                margin: EdgeInsets.only(bottom: 8),
//                child: DropdownButton<String>(
//                  value: "Spinning Flutter",
//                  icon: Icon(Icons.arrow_drop_down, color: Color(0xFFA9A9A9)),
//                  iconSize: 24,
//                  elevation: 16,
//                  style: bodyTextStyle,
//                  underline: null,
//                  onChanged: (String newValue) {
//                    setState(() {});
//                  },
//                  items: <String>[
//                    "Spinning Flutter",
//                    "Fibonacci",
//                    "Counter",
//                  ].map<DropdownMenuItem<String>>((String value) {
//                    return DropdownMenuItem<String>(
//                      value: value,
//                      child: Text(
//                        value,
//                        style: bodyTextStyle,
//                      ),
//                    );
//                  }).toList(),
//                ),
//              ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 16, 25, 16),
                  child: AspectRatio(
                    aspectRatio: videoAspectRatio,
                    child: (kIsWeb)
                        ? Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFFD3D3D3), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                            ),
                            child: HtmlElementView(
                              key: webViewKey,
                              viewType: codelabSelected,
                            ),
                          )
                        : WebView(
                            key: webViewKey,
                            initialUrl: codelabUrlSelected,
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: RichText(
                    text: TextSpan(
                      style: headlineSecondaryTextStyle,
                      children: [
                        TextSpan(text: "Want more practice? "),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openUrl("https://flutter.dev/codelabs");
                              },
                            text: "Try a codelab",
                            style: headlineSecondaryTextStyle.copyWith(
                                color: primary)),
                        TextSpan(text: ".")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setCodelabSelected(String codelab) {
    codelabSelected = codelab;
    codelabUrlSelected = codelabUrls[codelabIds.indexOf(codelab)];
    setCodelabHtmlElementView();
    setState(() {});
  }

  void setCodelabHtmlElementView() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        codelabSelected,
        (viewId) => html.IFrameElement()
          ..width = "1080"
          ..height = "617"
          ..src = codelabUrlSelected
          ..style.border = "none");
  }

  Widget getCupertinoSelectionWidget(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Text(text, style: bodyTextStyle),
    );
  }
}

class InstallFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      margin: EdgeInsets.fromLTRB(1, 0, 1, 32),
      padding: EdgeInsets.all(80),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          constraints: BoxConstraints.loose(Size(800, double.infinity)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text("Install Flutter today.", style: headlineTextStyle),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text("It’s free and open source.",
                    style: bodyTextStyle.copyWith(fontSize: 24)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: FlatButton(
                  onPressed: () =>
                      openUrl("https://flutter.dev/docs/get-started/install"),
                  color: primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                  padding: EdgeInsets.symmetric(vertical: 22, horizontal: 80),
                  child: Text(
                    "Get started",
                    style: buttonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
