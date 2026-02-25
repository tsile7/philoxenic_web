import 'package:flutter/material.dart';
import 'package:philoxenic_web/core/widgets/global_footer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SecurityView extends StatelessWidget {
  const SecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
            _HeroSection(),
            _ComplianceSection(),
            _SecurityFeaturesSection(),
            _CertificationsSection(),
            _CommitmentSection(),
            const GlobalFooter(),
          ],
        ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topRight,
          radius: 1.5,
          colors: [Color(0xFF1a1a2e), Colors.black],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF2ECC71).withOpacity(0.2),
                        Color(0xFF2ECC71).withOpacity(0.05),
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.shield_outlined,
                    size: 72,
                    color: Color(0xFF2ECC71),
                  ),
                )
                    .animate(onPlay: (controller) => controller.repeat())
                    .shimmer(
                      duration: 2000.ms,
                      color: Color(0xFF2ECC71).withOpacity(0.3),
                    ),
                const SizedBox(height: 48),
                Text(
                  'Security & Compliance',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0),
                const SizedBox(height: 24),
                Text(
                  'Enterprise-grade security built into every layer of our platform',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.grey.shade400,
                        height: 1.6,
                      ),
                ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ComplianceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      color: Color(0xFF0a0a0a),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF2ECC71).withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'COMPLIANCE STANDARDS',
                  style: TextStyle(
                    color: Color(0xFF2ECC71),
                    fontSize: 12,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Meeting Global Security Standards',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 64),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 1,
                crossAxisSpacing: 32,
                mainAxisSpacing: 32,
                childAspectRatio: 0.85,
                children: [
                  _ComplianceCard(
                    title: 'GDPR Compliant',
                    description:
                        'Full compliance with European data protection regulations.',
                    icon: Icons.gavel,
                    color: Color(0xFF00FF88),
                    features: [
                      'Right to be forgotten',
                      'Data portability',
                      'Consent management',
                      'Breach notifications',
                    ],
                    delay: 0,
                  ),
                  _ComplianceCard(
                    title: 'ISO 27001',
                    description: 'International security management standards.',
                    icon: Icons.workspace_premium,
                    color: Color(0xFFFF6B9D),
                    features: [
                      'Risk assessment',
                      'Access controls',
                      'Incident management',
                      'Continuous improvement',
                    ],
                    delay: 400,
                  ),
                  _ComplianceCard(
                    title: 'POPIA Compliant',
                    description: 'South African data privacy protection standards.',
                    icon: Icons.verified_user,
                    color: Color(0xFF2ECC71),
                    features: [
                      'Lawful processing',
                      'Data minimization',
                      'Security safeguards',
                      'Accountability measures',
                    ],
                    delay: 200,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ComplianceCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<String> features;
  final int delay;

  const _ComplianceCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.features,
    required this.delay,
  });

  @override
  State<_ComplianceCard> createState() => _ComplianceCardState();
}

class _ComplianceCardState extends State<_ComplianceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          gradient: _isHovered
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    widget.color.withOpacity(0.1),
                    Colors.transparent,
                  ],
                )
              : null,
          border: Border.all(
            color:
                _isHovered ? widget.color.withOpacity(0.5) : Colors.grey.shade800,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -8.0 : 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(widget.icon, size: 32, color: widget.color),
            ),
            const SizedBox(height: 24),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade400,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24),
            ...widget.features.map(
              (d) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: widget.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        d,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: Duration(milliseconds: widget.delay))
        .slideY(begin: 0.3, end: 0);
  }
}

class _SecurityFeaturesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.5,
          colors: [Color(0xFF0a0a0a), Colors.black],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF2ECC71).withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'SECURITY FEATURES',
                  style: TextStyle(
                    color: Color(0xFF2ECC71),
                    fontSize: 12,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Multi-Layered Protection',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 64),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 900 ? 2 : 1,
                crossAxisSpacing: 32,
                mainAxisSpacing: 32,
                childAspectRatio: MediaQuery.of(context).size.width > 900 ? 2.5 : 3,
                children: [
                  _SecurityFeature(
                    icon: Icons.lock_outline,
                    title: 'End-to-End Encryption',
                    description:
                        'AES-256 encryption for data at rest and TLS 1.3 for data in transit.',
                    delay: 0,
                  ),
                  _SecurityFeature(
                    icon: Icons.fingerprint,
                    title: 'Multi-Factor Authentication',
                    description:
                        'Additional security with SMS, email, and authenticator apps.',
                    delay: 100,
                  ),
                  _SecurityFeature(
                    icon: Icons.vpn_key,
                    title: 'Secure Authentication',
                    description: 'OAuth 2.0 and JWT with role-based access control.',
                    delay: 200,
                  ),
                  _SecurityFeature(
                    icon: Icons.cloud_done,
                    title: 'Cloud-Native Security',
                    description: '24/7 monitoring with automatic security updates.',
                    delay: 300,
                  ),
                  _SecurityFeature(
                    icon: Icons.backup,
                    title: 'Automated Backups',
                    description: 'Daily encrypted backups with point-in-time recovery.',
                    delay: 400,
                  ),
                  _SecurityFeature(
                    icon: Icons.bug_report,
                    title: 'Vulnerability Scanning',
                    description: 'Continuous testing and automated assessments.',
                    delay: 500,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SecurityFeature extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final int delay;

  const _SecurityFeature({
    required this.icon,
    required this.title,
    required this.description,
    required this.delay,
  });

  @override
  State<_SecurityFeature> createState() => _SecurityFeatureState();
}

class _SecurityFeatureState extends State<_SecurityFeature> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          border: Border.all(
            color: _isHovered
                ? Color(0xFF2ECC71).withOpacity(0.5)
                : Colors.grey.shade800,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -4.0 : 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFF2ECC71).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(widget.icon, size: 28, color: Color(0xFF2ECC71)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade400,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: Duration(milliseconds: widget.delay))
        .slideX(begin: -0.2, end: 0);
  }
}

class _CertificationsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      color: Color(0xFF0a0a0a),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF2ECC71).withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'INDUSTRY CERTIFICATIONS',
                  style: TextStyle(
                    color: Color(0xFF2ECC71),
                    fontSize: 12,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Trusted by Industry Leaders',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 64),
              Wrap(
                spacing: 32,
                runSpacing: 32,
                alignment: WrapAlignment.center,
                children: [
                  'SOC 2 Type II',
                  'ISO 27001',
                  'GDPR Ready',
                  'POPIA Compliant',
                  'HIPAA Compliant',
                  'PCI DSS',
                ]
                    .asMap()
                    .entries
                    .map(
                      (e) => _CertBadge(e.value, e.key),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CertBadge extends StatefulWidget {
  final String name;
  final int index;

  const _CertBadge(this.name, this.index);

  @override
  State<_CertBadge> createState() => _CertBadgeState();
}

class _CertBadgeState extends State<_CertBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        decoration: BoxDecoration(
          gradient: _isHovered
              ? LinearGradient(
                  colors: [
                    Color(0xFF2ECC71).withOpacity(0.2),
                    Color(0xFF2ECC71).withOpacity(0.05),
                  ],
                )
              : null,
          border: Border.all(
            color: _isHovered ? Color(0xFF2ECC71) : Colors.grey.shade800,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _isHovered ? Color(0xFF2ECC71) : Colors.grey.shade300,
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: Duration(milliseconds: widget.index * 100))
        .scale();
  }
}

class _CommitmentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2ECC71).withOpacity(0.05),
            Colors.black,
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              Icon(
                Icons.security,
                size: 72,
                color: Color(0xFF2ECC71),
              )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(
                    duration: 2000.ms,
                    color: Color(0xFF2ECC71).withOpacity(0.3),
                  ),
              const SizedBox(height: 48),
              Text(
                'Our Security Commitment',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
              ).animate().fadeIn(duration: 600.ms),
              const SizedBox(height: 24),
              Text(
                'Security is not just a feature—it\'s the foundation of everything we build. We continuously monitor, test, and improve our systems to protect your data and maintain your trust.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.grey.shade400,
                      height: 1.6,
                    ),
              ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
              const SizedBox(height: 64),
              Wrap(
                spacing: 64,
                runSpacing: 32,
                alignment: WrapAlignment.center,
                children: [
                  _StatItem('99.99%', 'Uptime SLA'),
                  _StatItem('24/7', 'Security Monitoring'),
                  _StatItem('< 1hr', 'Incident Response'),
                ],
              ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Color(0xFF2ECC71), Color(0xFF00D4FF)],
          ).createShader(bounds),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}