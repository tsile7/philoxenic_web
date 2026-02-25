import 'package:flutter/material.dart';
import '../privacy/cookie_consent_service.dart';
import '../analytics/analytics_service.dart';

class CookieConsentBanner extends StatefulWidget {
  const CookieConsentBanner({super.key});

  @override
  State<CookieConsentBanner> createState() => _CookieConsentBannerState();
}

class _CookieConsentBannerState extends State<CookieConsentBanner> 
    with SingleTickerProviderStateMixin {
  bool _visible = false;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _visible = CookieConsentService.getConsent() == null;
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    if (_visible) {
      Future.delayed(const Duration(milliseconds: 700), () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleAccept() {
    CookieConsentService.accept();
    AnalyticsService.init();
    _dismiss();
  }

  void _handleReject() {
    CookieConsentService.reject();
    _dismiss();
  }

  void _dismiss() {
    _controller.reverse().then((_) {
      if (mounted) {
        setState(() => _visible = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_visible) return const SizedBox.shrink();

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return SlideTransition(
      position: _slideAnimation,
      child: Positioned(
        // Position at absolute bottom
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          // Add subtle top shadow
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: SafeArea(
            // Only apply SafeArea to bottom
            top: false,
            left: false,
            right: false,
            child: Padding(
              padding: EdgeInsets.only(
                left: isMobile ? 16 : 24,
                right: isMobile ? 16 : 24,
                bottom: isMobile ? 12 : 16,
              ),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: isMobile ? double.infinity : 580,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0a0a0a),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        blurRadius: 25,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16 : 20,
                      vertical: isMobile ? 12 : 14,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Cookie Icon
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2ECC71).withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.cookie_outlined,
                            color: Color(0xFF2ECC71),
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 12),
                        
                        // Text
                        Flexible(
                          child: Text(
                            isMobile 
                                ? 'We use cookies' 
                                : 'We use cookies to improve experience',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 12),
                        
                        // Buttons
                        _buildPillButton(
                          label: 'Decline',
                          onPressed: _handleReject,
                          isPrimary: false,
                        ),
                        const SizedBox(width: 8),
                        _buildPillButton(
                          label: 'Accept',
                          onPressed: _handleAccept,
                          isPrimary: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPillButton({
    required String label,
    required VoidCallback onPressed,
    required bool isPrimary,
  }) {
    return _PillButton(
      label: label,
      onPressed: onPressed,
      isPrimary: isPrimary,
    );
  }
}

class _PillButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isPrimary;

  const _PillButton({
    required this.label,
    required this.onPressed,
    required this.isPrimary,
  });

  @override
  State<_PillButton> createState() => _PillButtonState();
}

class _PillButtonState extends State<_PillButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: widget.isPrimary
                ? LinearGradient(
                    colors: [
                      _isHovered ? const Color(0xFF34D77E) : const Color(0xFF2ECC71),
                      _isHovered ? const Color(0xFF0DE4FF) : const Color(0xFF00D4FF),
                    ],
                  )
                : null,
            color: !widget.isPrimary
                ? (_isHovered 
                    ? Colors.white.withOpacity(0.15) 
                    : Colors.white.withOpacity(0.08))
                : null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: widget.isPrimary ? Colors.white : Colors.white70,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ),
    );
  }
}