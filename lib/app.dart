import 'package:flutter/material.dart';
import 'core/design_system/theme.dart';
import 'core/routing/router.dart';

class PhiloxenicApp extends StatelessWidget {
  const PhiloxenicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Philoxenic',
      theme: AppTheme.light,
      routerConfig: router,
    );
  }
}
