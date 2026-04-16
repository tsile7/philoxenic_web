import 'package:flutter/material.dart';

class GlobalFooter extends StatelessWidget {
  const GlobalFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF0a0a0a),
            Colors.black,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 40 : 80,
          horizontal: 24,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isMobile) _buildMobileFooter() else _buildDesktopFooter(),
                const SizedBox(height: 48),
                const Divider(color: Colors.white12),
                const SizedBox(height: 24),
                _buildCopyright(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopFooter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildBrandSection(),
        ),
        const SizedBox(width: 80),
        Expanded(
          child: _buildLinksSection('Pages', [
            'About',
            'Products',
            'Security',
          ]),
        ),
        Expanded(
          child: _buildLinksSection('Resources', [
            'Contact',
            'Support',
            'Documentation',
          ]),
        ),
      ],
    );
  }

  Widget _buildMobileFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBrandSection(),
        const SizedBox(height: 32),
        _buildLinksSection('Pages', [
          'About',
          'Products',
          'Security',
        ]),
        const SizedBox(height: 24),
        _buildLinksSection('Resources', [
          'Contact',
          'Support',
          'Documentation',
        ]),
      ],
    );
  }

  Widget _buildBrandSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/philoxenic_logo_transparent.png',
          height: 48,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 16),
        const Text(
          'Making Life Easier For The Next Person',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 14,
            height: 1.6,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Creating powerful, user-friendly software solutions for businesses and individuals.',
          style: TextStyle(
            color: Colors.white70,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSocialIcon(Icons.language),
            const SizedBox(width: 12),
            _buildSocialIcon(Icons.email_outlined),
            const SizedBox(width: 12),
            _buildSocialIcon(Icons.phone_outlined),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: Colors.white70,
        size: 20,
      ),
    );
  }

  Widget _buildLinksSection(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  link,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildCopyright() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '© ${DateTime.now().year} Philoxenic. All rights reserved.',
          style: const TextStyle(
            color: Colors.white38,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}