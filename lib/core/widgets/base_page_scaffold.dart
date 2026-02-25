import 'package:flutter/material.dart';
import 'global_navbar.dart';
import 'mobile_nav_drawer.dart';
import 'cookie_consent_banner.dart';

// Base scaffold that includes navbar, drawer, and cookie consent : To ensure consistent navigation.
class BasePageScaffold extends StatelessWidget {
  final Widget body;
  final bool showNavBar;

  const BasePageScaffold({
    super.key, 
    required this.body,
    this.showNavBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const MobileNavDrawer(),
      appBar: showNavBar ? const GlobalNavBar() : null,
      body: Stack(
        children: [
          body,
          const CookieConsentBanner(),
        ],
      ),
    );
  }
}