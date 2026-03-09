import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:philoxenic_web/core/widgets/base_page_scaffold.dart';
import 'package:philoxenic_web/ui/company/about_view.dart';
import 'package:philoxenic_web/ui/contact/contact_view.dart';
import 'package:philoxenic_web/ui/home/home_view.dart';
//import 'package:philoxenic_web/ui/platform/platform_view.dart';
import 'package:philoxenic_web/ui/products/products_view.dart';
import 'package:philoxenic_web/ui/security/security_view.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return BasePageScaffold(body: child);
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomeView(),
        ),
        /*GoRoute(
          path: '/platform',
          name: 'platform',
          builder: (context, state) => const PlatformView(), // TODO: Edit later with our products
        ),*/
        GoRoute(
          path: '/about',
          name: 'about',
          builder: (context, state) => const AboutView(),
        ),
        GoRoute(
          path: '/products',
          name: 'products',
          builder: (context, state) => const ProductsView(),
        ),
        GoRoute(
          path: '/security',
          name: 'security',
          builder: (context, state) => const SecurityView(),
        ),
        /*GoRoute(
          path: '/pricing',
          name: 'pricing',
          builder: (context, state) => const PricingView(), // TODO: Create later for adding prices
        ),*/
        GoRoute(
          path: '/contact',
          name: 'contact',
          builder: (context, state) => const ContactView(),
        ),
      ],
    ),
  ],
  
  // Error handling
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            '404 - Page Not Found',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text('The page "${state.uri}" does not exist.'),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Text('Go Home'),
          ),
        ],
      ),
    ),
  ),
);

// TODO: Placeholder for pricing view (Create dart file)
class PricingView extends StatelessWidget {
  const PricingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pricing',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Coming Soon',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}