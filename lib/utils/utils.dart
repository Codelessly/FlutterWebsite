import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> openUrl(String url, {bool newWindow = false}) async {
  try {
    if (await canLaunchUrl(Uri.parse(url))) {
      return await launchUrl(
        Uri.parse(url),
      );
    } else {
      debugPrint("Could not launch $url");
      return false;
    }
  } catch (e) {
    debugPrint("Could not launch $url");
    return false;
  }
}
