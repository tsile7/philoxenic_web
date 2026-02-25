import 'package:flutter/widgets.dart';
import '../../config/seo/seo_manager.dart';
import '../../config/analytics/analytics_service.dart';

class SeoWrapper extends StatefulWidget {
  final Widget child;
  final String title;
  final String description;

  const SeoWrapper({
    super.key,
    required this.child,
    required this.title,
    required this.description,
  });

  @override
  State<SeoWrapper> createState() => _SeoWrapperState();
}

class _SeoWrapperState extends State<SeoWrapper> {
  @override
  void initState() {
    super.initState();

    final path = Uri.base.path;

    SeoManager.setMeta(
      title: widget.title,
      description: widget.description,
      url: Uri.base.toString(),
    );

    AnalyticsService.trackPage(path, widget.title); // ✅ PAGE VIEW
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
