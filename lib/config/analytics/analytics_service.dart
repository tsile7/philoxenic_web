// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class AnalyticsService {
  static const _measurementId = 'G-XXXXXXXXXX'; // Your GA4 ID
  static bool _initialized = false;

  static void init() {
    if (_initialized) return;

    js.context.callMethod('initGA', [_measurementId]);
    _initialized = true;
  }

  // Extra safety: Prevent crashes if GA isn’t loaded yet
  static void trackPage(String path, String title) {
    if (!_initialized) return;

    try {
      js.context.callMethod('gtag', [
        'event',
        'page_view',
        {
          'page_path': path,
          'page_title': title,
        }
      ]);
    } catch (e) {
      // GA not ready or blocked – fail silently
    }
  }
}
