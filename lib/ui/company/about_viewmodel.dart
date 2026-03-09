import 'package:url_launcher/url_launcher.dart';

Future<void> openWhatsAppChannel() async {
  final Uri url = Uri.parse("https://whatsapp.com/channel/0029VbAbcnWBvvsiEDbvGi3k");

  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}