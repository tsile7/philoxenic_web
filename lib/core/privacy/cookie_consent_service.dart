// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class CookieConsentService {
  static const _key = 'cookie_consent';

  static bool? getConsent() {
    final value = html.window.localStorage[_key];
    if (value == null) return null;
    return value == 'true';
  }

  static void accept() {
    html.window.localStorage[_key] = 'true';
  }

  static void reject() {
    html.window.localStorage[_key] = 'false';
  }
}
