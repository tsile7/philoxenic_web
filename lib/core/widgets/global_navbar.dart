import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import '../routing/route_utils.dart';

class GlobalNavBar extends StatefulWidget implements PreferredSizeWidget {
  const GlobalNavBar({super.key});

  @override
  State<GlobalNavBar> createState() => _GlobalNavBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _GlobalNavBarState extends State<GlobalNavBar> {

  @override
  void initState() {
    super.initState();
    // Add scroll listener if needed
  }

  bool _isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 900;

  @override
  Widget build(BuildContext context) {
    final mobile = _isMobile(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0.7),
            toolbarHeight: 80,
            leading: mobile
                ? Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  )
                : null,
            title: Padding(
              padding: mobile 
                  ? EdgeInsets.zero 
                  : const EdgeInsets.only(left: 24),
              child: GestureDetector(
                onTap: () => context.go('/'),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logo placeholder - replace with actual logo
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
              ),
            ),
            actions: mobile
                ? []
                : [
                    const _NavItem('Platform', '/platform'),
                    const _NavItem('About', '/about'),
                    const _NavItem('Products', '/products'),
                    const _NavItem('Security', '/security'),
                    // const _NavItem('Pricing', '/pricing'),
                    const SizedBox(width: 16),
                    _ContactButton(),
                    const SizedBox(width: 32),
                  ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final String route;

  const _NavItem(this.label, this.route);

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> with SingleTickerProviderStateMixin {
  bool _hovering = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isActive(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    return location == widget.route;
  }

  @override
  Widget build(BuildContext context) {
    final active = _isActive(context);

    if (active || _hovering) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(widget.route),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: active || _hovering ? FontWeight.w600 : FontWeight.w500,
                  color: active || _hovering 
                      ? const Color(0xFF2ECC71) 
                      : Colors.white70,
                  letterSpacing: 0.3,
                ),
                child: Text(widget.label),
              ),
              const SizedBox(height: 4),
              AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Container(
                    height: 2,
                    width: 24 * _scaleAnimation.value,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2ECC71), Color(0xFF00D4FF)],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactButton extends StatefulWidget {
  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go('/contact'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            gradient: _isHovered
                ? const LinearGradient(
                    colors: [Color(0xFF2ECC71), Color(0xFF00D4FF)],
                  )
                : null,
            border: Border.all(
              color: _isHovered 
                  ? Colors.transparent 
                  : const Color(0xFF2ECC71),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Contact',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}