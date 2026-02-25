import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import '../routing/route_utils.dart';

class MobileNavDrawer extends StatelessWidget {
  const MobileNavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0a0a0a),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2ECC71), Color(0xFF00D4FF)],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.spa_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Philoxenic',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Colors.white12),
            const SizedBox(height: 8),
            const _Item('Platform', '/platform'),
            const _Item('About', '/about'),
            const _Item('Products', '/products'),
            const _Item('Security', '/security'),
            // const _Item('Pricing', '/pricing'),
            const _Item('Contact', '/contact'),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String label;
  final String route;

  const _Item(this.label, this.route);

  @override
  Widget build(BuildContext context) {
    final active = GoRouterState.of(context).uri.path == route;

    return InkWell(
      onTap: () {
        Navigator.pop(context);
        context.go(route);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          gradient: active
              ? LinearGradient(
                  colors: [
                    const Color(0xFF2ECC71).withOpacity(0.1),
                    const Color(0xFF00D4FF).withOpacity(0.1),
                  ],
                )
              : null,
          border: Border(
            left: BorderSide(
              color: active 
                  ? const Color(0xFF2ECC71) 
                  : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: active ? FontWeight.w600 : FontWeight.w500,
                color: active 
                    ? const Color(0xFF2ECC71) 
                    : Colors.white70,
                letterSpacing: 0.3,
              ),
            ),
            if (active) ...[
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: const Color(0xFF2ECC71),
              ),
            ],
          ],
        ),
      ),
    );
  }
}