import 'package:flutter/material.dart';
import 'package:philoxenic_web/app.dart';
import 'core/privacy/cookie_consent_service.dart';
import 'core/analytics/analytics_service.dart';


void main() {
    if (CookieConsentService.getConsent() == true) {
    AnalyticsService.init();
  }
  
  runApp(const PhiloxenicApp());
}
