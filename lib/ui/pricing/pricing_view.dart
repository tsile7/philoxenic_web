import 'package:flutter/material.dart';
import 'package:philoxenic_web/core/widgets/global_footer.dart';
import 'package:philoxenic_web/core/widgets/global_navbar.dart';
import 'package:philoxenic_web/core/widgets/mobile_nav_drawer.dart';

class PricingView extends StatelessWidget {
  const PricingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MobileNavDrawer(),
      appBar: const GlobalNavBar(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enterprise Pricing',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Flexible pricing tailored to your business scale.',
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/contact'),
                      child: const Text('Contact Sales'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const GlobalFooter(),
        ],
      ),
    );
  }
}
