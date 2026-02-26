import 'package:flutter/material.dart';
import 'package:philoxenic_web/core/widgets/global_footer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
            _HeroSection(),
            _MissionSection(),
            _ValuesSection(),
            _StatsSection(),
            _TeamSection(),
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
                    'ABOUT US',
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
                  'About Philoxenic',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0),
                const SizedBox(height: 24),
                Text(
                  'An innovative South African IT company dedicated to developing cutting-edge, user-centered software solutions for businesses and individuals. Rooted in the country’s dynamic tech ecosystem and inspired by the spirit of generosity and genuine care, the company places hospitality, community, and client relationships at the heart of its work.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.grey.shade400,
                        height: 1.6,
                      ),
                ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
                const SizedBox(height: 24),
                Text(
                'Philoxenic exists to make a meaningful impact—combining creativity and technical expertise to deliver high-performance enterprise systems and consumer applications while upholding ethical, sustainable, and socially responsible practices. With a vision that is global yet grounded in local values, Philoxenic is committed to empowering people, strengthening communities, and driving positive change through technology.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.grey.shade400,
                      height: 1.8,
                    ),
              ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MissionSection extends StatelessWidget {
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
                  'OUR MISSION',
                  style: TextStyle(
                    color: Color(0xFF2ECC71),
                    fontSize: 12,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [Color(0xFF2ECC71), Color(0xFF00D4FF)],
                ).createShader(bounds),
                child: Text(
                  'Making IT Easier for the Next Person',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                ),
              ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
              const SizedBox(height: 32),
              Text(
                'To deliver innovative and responsible software solutions while uplifting society through ethical practices, sustainable development, and youth empowerment.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.grey.shade400,
                      height: 1.8,
                    ),
              ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _ValuesSection extends StatelessWidget {
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
                  'OUR VALUES',
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
                'What Drives Us',
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
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: MediaQuery.of(context).size.width > 900 ? 1.8 : 2.2,
                children: [
                  _ValueCard(
                    icon: Icons.handshake_outlined,
                    title: 'Integrity',
                    description:
                        'We do what’s right—always.',
                    delay: 0,
                  ),
                  _ValueCard(
                    icon: Icons.lightbulb_outline,
                    title: 'Creativity',
                    description:
                        'We innovate with purpose and forward-thinking.',
                    delay: 100,
                  ),
                  _ValueCard(
                    icon: Icons.verified_user_outlined,
                    title: 'Reliability',
                    description:
                        'We deliver consistently and stand by our work.',
                    delay: 200,
                  ),
                  _ValueCard(
                    icon: Icons.groups_outlined,
                    title: 'Hospitality & Social Responsibility',
                    description:
                        'We treat every client with warmth and respect, making thoughtful choices that benefit both business and society.',
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

class _ValueCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final int delay;

  const _ValueCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.delay,
  });

  @override
  State<_ValueCard> createState() => _ValueCardState();
}

class _ValueCardState extends State<_ValueCard> {
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
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF2ECC71).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.icon,
                size: 36,
                color: Color(0xFF2ECC71),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade400,
                height: 1.6,
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

class _StatsSection extends StatelessWidget {
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
                  'OUR EXPERTISE',
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
                'Combined Experience',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 64),
              Wrap(
                spacing: 64,
                runSpacing: 64,
                alignment: WrapAlignment.center,
                children: [
                  _StatItem(number: '99.9%', label: 'Uptime SLA', delay: 0),
                  _StatItem(number: '10+', label: 'Projects Delivered', delay: 100),
                  _StatItem(number: '7+', label: 'Years Experience', delay: 200),
                  _StatItem(number: '24/7', label: 'Support Available', delay: 300),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String number;
  final String label;
  final int delay;

  const _StatItem({
    required this.number,
    required this.label,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Color(0xFF2ECC71), Color(0xFF00D4FF)],
            ).createShader(bounds),
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay))
        .scale();
  }
}

class _TeamSection extends StatelessWidget {
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
          child: Container(
            padding: const EdgeInsets.all(64),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF2ECC71).withOpacity(0.3)),
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF2ECC71).withOpacity(0.05),
                  Colors.transparent,
                ],
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Join Our Community',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                ).animate().fadeIn(duration: 600.ms),
                const SizedBox(height: 24),
                Text(
                  'We\'re always looking for talented individuals passionate about tech.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade400,
                        height: 1.6,
                      ),
                ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
                const SizedBox(height: 48),
                _AnimatedButton(
                  text: 'View Channel',
                  onPressed: () {},
                ).animate().fadeIn(duration: 600.ms, delay: 400.ms).scale(),
              ],
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
        ),
      ),
    );
  }
}

class _AnimatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const _AnimatedButton({
    required this.text,
    required this.onPressed,
  });

  @override
  State<_AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<_AnimatedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        child: OutlinedButton(
          onPressed: widget.onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: _isHovered ? Colors.black : Color(0xFF2ECC71),
            backgroundColor: _isHovered ? Color(0xFF2ECC71) : Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: BorderSide(
              color: Color(0xFF2ECC71),
              width: 2,
            ),
          ),
          child: Text(
            widget.text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}