import 'package:flutter/material.dart';
import '../../core/widgets/global_footer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PlatformView extends StatelessWidget {
  const PlatformView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
            _HeroSection(),
            _ArchitectureSection(),
            _TechnologyStackSection(),
            _BenefitsSection(),
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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF2ECC71).withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'PLATFORM',
                    style: TextStyle(
                      color: Color(0xFF2ECC71),
                      fontSize: 12,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ).animate().fadeIn(duration: 600.ms).scale(),
                const SizedBox(height: 32),
                Text(
                  'Scalable SaaS Platform Architecture',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0),
                const SizedBox(height: 24),
                Text(
                  'Built on cloud-native principles with enterprise-grade reliability, security, and performance at its core.',
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

class _ArchitectureSection extends StatelessWidget {
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
                  'ARCHITECTURE',
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
                'Cloud-Native Design',
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
                  _ArchCard(
                    title: 'Microservices',
                    description:
                        'Independent services that scale independently with fault tolerance.',
                    features: [
                      'Service isolation',
                      'Independent scaling',
                      'Technology flexibility',
                      'Fault tolerance',
                    ],
                    delay: 0,
                  ),
                  _ArchCard(
                    title: 'API Gateway',
                    description:
                        'Centralized entry point with security, rate limiting, and monitoring.',
                    features: [
                      'Request routing',
                      'Load balancing',
                      'Authentication',
                      'API versioning',
                    ],
                    delay: 200,
                  ),
                  _ArchCard(
                    title: 'Data Layer',
                    description:
                        'Distributed storage with caching and real-time synchronization.',
                    features: [
                      'Multi-database support',
                      'Real-time sync',
                      'Data encryption',
                      'Automatic backups',
                    ],
                    delay: 400,
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

class _ArchCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> features;
  final int delay;

  const _ArchCard({
    required this.title,
    required this.description,
    required this.features,
    required this.delay,
  });

  @override
  State<_ArchCard> createState() => _ArchCardState();
}

class _ArchCardState extends State<_ArchCard> {
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
                    Color(0xFF2ECC71).withOpacity(0.1),
                    Colors.transparent,
                  ],
                )
              : null,
          border: Border.all(
            color: _isHovered
                ? Color(0xFF2ECC71).withOpacity(0.5)
                : Colors.grey.shade800,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -8.0 : 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
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
              (f) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Color(0xFF2ECC71),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        f,
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

class _TechnologyStackSection extends StatelessWidget {
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
                  'TECHNOLOGY STACK',
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
                'Modern, Battle-Tested Technologies',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 64),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  _TechBadge('AWS', Icons.cloud),
                  _TechBadge('Kubernetes', Icons.apps),
                  _TechBadge('PostgreSQL', Icons.storage),
                  _TechBadge('React', Icons.web),
                  _TechBadge('Flutter', Icons.phone_android),
                  _TechBadge('Node.js', Icons.code),
                  _TechBadge('Python', Icons.laptop_mac),
                  _TechBadge('Docker', Icons.view_in_ar),
                ].asMap().entries.map((e) {
                  return e.value
                      .animate()
                      .fadeIn(
                        duration: 600.ms,
                        delay: Duration(milliseconds: e.key * 100),
                      )
                      .scale();
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TechBadge extends StatefulWidget {
  final String name;
  final IconData icon;

  const _TechBadge(this.name, this.icon);

  @override
  State<_TechBadge> createState() => _TechBadgeState();
}

class _TechBadgeState extends State<_TechBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: _isHovered
              ? Color(0xFF2ECC71).withOpacity(0.1)
              : Colors.grey.shade900,
          border: Border.all(
            color: _isHovered ? Color(0xFF2ECC71) : Colors.grey.shade800,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon,
              size: 20,
              color: _isHovered ? Color(0xFF2ECC71) : Colors.grey.shade400,
            ),
            const SizedBox(width: 8),
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: _isHovered ? Colors.white : Colors.grey.shade300,
              ),
            ),
          ],
        ),
      )  
    );
  }
}

class _BenefitsSection extends StatelessWidget {
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
                  'PLATFORM BENEFITS',
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
                'Why Our Platform Stands Out',
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
                childAspectRatio: 3,
                children: [
                  _BenefitItem(
                    icon: Icons.bolt,
                    title: 'High Performance',
                    description: 'Sub-second response times',
                    delay: 0,
                  ),
                  _BenefitItem(
                    icon: Icons.shield,
                    title: 'Enterprise Security',
                    description: 'Bank-level encryption',
                    delay: 100,
                  ),
                  _BenefitItem(
                    icon: Icons.auto_awesome,
                    title: 'Auto-Scaling',
                    description: 'Handle traffic spikes',
                    delay: 200,
                  ),
                  _BenefitItem(
                    icon: Icons.update,
                    title: 'Zero-Downtime',
                    description: 'Seamless deployments',
                    delay: 300,
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

class _BenefitItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final int delay;

  const _BenefitItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade800),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFF2ECC71).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 24, color: Color(0xFF2ECC71)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay))
        .slideX(begin: -0.2, end: 0);
  }
}