// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class SeoManager {
  static void setMeta({
    required String title,
    required String description,
    String? image,
    String? url,
  }) {
    // Title
    html.document.title = title;

    _setMetaTag('description', description);

    // Open Graph
    _setPropertyTag('og:title', title);
    _setPropertyTag('og:description', description);
    _setPropertyTag('og:type', 'website');

    if (url != null) {
      _setPropertyTag('og:url', url);
    }

    if (image != null) {
      _setPropertyTag('og:image', image);
    }

    // Twitter
    _setMetaTag('twitter:card', 'summary_large_image');
    _setMetaTag('twitter:title', title);
    _setMetaTag('twitter:description', description);
    if (image != null) {
      _setMetaTag('twitter:image', image);
    }
  }

  static void _setMetaTag(String name, String content) {
    final element = html.document.head!
        .querySelector('meta[name="$name"]') as html.MetaElement?;

    if (element != null) {
      element.content = content;
    } else {
      final meta = html.MetaElement()
        ..name = name
        ..content = content;
      html.document.head!.append(meta);
    }
  }

  static void _setPropertyTag(String property, String content) {
    final element = html.document.head!
        .querySelector('meta[property="$property"]') as html.MetaElement?;

    if (element != null) {
      element.content = content;
    } else {
      final meta = html.MetaElement()
        ..setAttribute('property', property)
        ..content = content;
      html.document.head!.append(meta);
    }
  }
}
