import 'package:url_launcher/url_launcher.dart';

Future<bool> openUrl(String url, {bool newWindow = false}) async {
  if (await canLaunch(url)) {
    return await launch(
      url,
    );
  } else {
    print("Could not launch $url");
    return false;
  }
}
