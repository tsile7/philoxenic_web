import 'package:flutter/material.dart';
import 'package:philoxenic_web/app.dart';
import 'config/privacy/cookie_consent_service.dart';
import 'config/analytics/analytics_service.dart';


void main() {
    if (CookieConsentService.getConsent() == true) {
    AnalyticsService.init();
  }
  
  runApp(const PhiloxenicApp());
}
