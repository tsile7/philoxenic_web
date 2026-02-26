import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/global_footer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeContent();
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
            _HeroSection(),
            _TrustedBySection(),
            //_AboutSection(),
            _BenefitsSection(),
            _FeaturesSection(),
            _StepsSection(),
            _CTASection(),
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
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topRight,
          radius: 1.5,
          colors: [
            Color(0xFF1a1a2e),
            Colors.black,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Animated background pattern
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: CustomPaint(
                painter: _GridPainter(),
              ),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome To Philoxenic',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 64,
                            height: 1.1,
                          ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideY(begin: 0.3, end: 0),
                    const SizedBox(height: 16),
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [Color(0xFF2ECC71), Color(0xFF00D4FF)],
                      ).createShader(bounds),
                      child: Text(
                        'Innovative. Reliable. Human-Centered.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontSize: 64,
                              height: 1.1,
                            ),
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 200.ms)
                        .slideY(begin: 0.3, end: 0),
                    const SizedBox(height: 32),
                    Text(
                      'Philoxenic is a South African IT company dedicated to creating powerful, user-friendly software solutions for businesses and individuals. Our approach blends cutting-edge technology with the warmth, generosity, and integrity reflected in our name.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.grey.shade400,
                            height: 1.6,
                          ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 400.ms)
                        .slideY(begin: 0.3, end: 0),
                    const SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _AnimatedButton(
                          text: 'Get Started',
                          isPrimary: true,
                          onPressed: () {},
                        ).animate().fadeIn(duration: 600.ms, delay: 600.ms).scale(),
                        const SizedBox(width: 16),
                        _AnimatedButton(
                          text: 'Explore Solutions',
                          isPrimary: false,
                          onPressed: () {},
                        ).animate().fadeIn(duration: 600.ms, delay: 700.ms).scale(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.1)
      ..strokeWidth = 1;

    for (double i = 0; i < size.width; i += 40) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += 40) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _AnimatedButton extends StatefulWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback onPressed;

  const _AnimatedButton({
    required this.text,
    required this.isPrimary,
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
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.isPrimary
                ? Color(0xFF2ECC71)
                : Colors.transparent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: widget.isPrimary ? Colors.transparent : Colors.white,
                width: 2,
              ),
            ),
            elevation: widget.isPrimary ? 8 : 0,
            shadowColor: widget.isPrimary
                ? Color(0xFF2ECC71).withOpacity(0.5)
                : Colors.transparent,
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

class _TrustedBySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Colors.black,
      child: Center(
        child: Column(
          children: [
            Text(
              'Our Values',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
              ),
            ).animate().fadeIn(duration: 600.ms),
            const SizedBox(height: 48),
            Wrap(
              spacing: 64,
              runSpacing: 32,
              alignment: WrapAlignment.center,
              children: [
                'Integrity',
                'Creativity',
                'Reliability',
                'Hospiltality',
                'Social Responsibility',
              ]
                  .map((name) => Text(
                        name,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                  .toList(),
            ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
          ],
        ),
      )  
    );
  }
}

/*class _AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Color(0xFF0a0a0a)],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              _SectionLabel('About Us'),
              const SizedBox(height: 32),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                      ),
                  children: [
                    const TextSpan(text: 'We empower businesses with '),
                    TextSpan(
                      text: 'Philoxenic ',
                      style: TextStyle(
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: [Color(0xFF2ECC71), Color(0xFF00D4FF)],
                          ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                      ),
                    ),
                    const TextSpan(
                        text:
                            'solutions that enhance efficiency, drive growth, and optimize operations.'),
                  ],
                ),
              ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
            ],
          ),
        ),
      ),
    );
  }
}*/

class _SectionLabel extends StatelessWidget {
  final String text;

  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF2ECC71).withOpacity(0.3)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: Color(0xFF2ECC71),
          fontSize: 12,
          letterSpacing: 2,
          fontWeight: FontWeight.w600,
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).scale();
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
              _SectionLabel('Benefits'),
              const SizedBox(height: 32),
              Text(
                'Why Choose Us?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
              ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
              const SizedBox(height: 64),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 1,
                crossAxisSpacing: 32,
                mainAxisSpacing: 32,
                childAspectRatio: 1.1,
                children: [
                  _BenefitCard(
                    icon: Icons.trending_up,
                    title: 'Client-focused Approach',
                    description:
                        'Putting the client’s needs first and delivering tailored solutions that create real value.',
                    delay: 0,
                  ),
                  _BenefitCard(
                    icon: Icons.attach_money,
                    title: 'Ethical & Sustainable Practices',
                    description:
                        'Acting with integrity while making socially and environmentally responsible decisions.',
                    delay: 200,
                  ),
                  _BenefitCard(
                    icon: Icons.auto_awesome,
                    title: 'Empowering Technology + People',
                    description:
                        'Using technology to drive results while supporting people’s growth and success.',
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

class _BenefitCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final int delay;

  const _BenefitCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.delay,
  });

  @override
  State<_BenefitCard> createState() => _BenefitCardState();
}

class _BenefitCardState extends State<_BenefitCard> {
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
            width: 1,
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
                color: Color(0xFF2ECC71).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.icon,
                size: 32,
                color: Color(0xFF2ECC71),
              ),
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
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: Duration(milliseconds: widget.delay))
        .slideY(begin: 0.3, end: 0);
  }
}

class _FeaturesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.5,
          colors: [
            Color(0xFF0a0a0a),
            Colors.black,
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              _SectionLabel('Features'),
              const SizedBox(height: 32),
              Text(
                'What Our Solutions Can Do For You',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
              ).animate().fadeIn(duration: 600.ms),
              const SizedBox(height: 64),
              _FeatureRow(
                title: 'Custom Software Development',
                description:
                    'We design and build tailored software solutions engineered to meet unique business needs, enhance workflows, and drive long-term growth.',
                isReversed: false,
              ),
              const SizedBox(height: 48),
              _FeatureRow(
                title: 'Web Application Development',
                description:
                    'Modern, fast, secure, and responsive web apps that deliver seamless user experiences across all devices.',
                isReversed: true,
              ),
              const SizedBox(height: 48),
              _FeatureRow(
                title: 'Mobile Application Development',
                description:
                    'Intuitive and scalable Android and iOS mobile applications that keep users engaged and connected.',
                isReversed: false,
              ),
              _FeatureRow(
                title: 'Business Systems & Automation',
                description:
                    'Improve efficiency and reduce manual work with bespoke systems and automated workflows that simplify operations.',
                isReversed: true,
              ),
              _FeatureRow(
                title: 'UI/UX Design',
                description:
                    'Human-centered design that ensures your product is visually engaging, intuitive, and easy to use.',
                isReversed: false,
              ),
              _FeatureRow(
                title: 'IT Consulting & Support',
                description:
                    'Expert guidance to help you make the right technology decisions—plus ongoing support to keep your systems running smoothly.',
                isReversed: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final String title;
  final String description;
  final bool isReversed;

  const _FeatureRow({
    required this.title,
    required this.description,
    required this.isReversed,
  });

  @override
  Widget build(BuildContext context) {
    final content = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade400,
              height: 1.6,
            ),
          ),
        ],
      ),
    );

    final visual = Expanded(
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2ECC71).withOpacity(0.2),
              Color(0xFF00D4FF).withOpacity(0.1),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xFF2ECC71).withOpacity(0.3)),
        ),
        child: Center(
          child: Icon(
            Icons.auto_awesome,
            size: 64,
            color: Color(0xFF2ECC71).withOpacity(0.5),
          ),
        ),
      ),
    );

    return Row(
      children: isReversed
          ? [visual, const SizedBox(width: 64), content]
          : [content, const SizedBox(width: 64), visual],
    ).animate().fadeIn(duration: 600.ms).slideX(begin: isReversed ? 0.2 : -0.2, end: 0);
  }
}

class _StepsSection extends StatelessWidget {
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
              Text(
                '3 Simple Reasons',
                style: TextStyle(
                  color: Color(0xFF2ECC71),
                  fontSize: 14,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Why We Are Here',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 64),
              ...List.generate(3, (index) {
                final steps = [
                  ('Purpose', 'We go beyond software, focusing on sustainability, ethics, and meaningful community impact—not just financial success.'),
                  ('Potential', 'We create innovative, user-focused software that combines advanced technology and strategic thinking to deliver high-performance, human-centered digital solutions.'),
                  ('Destiny', 'Philoxenic aims to grow locally and globally by delivering innovative, responsible technology that empowers people and businesses while driving positive change.'),
                  //('Analyze & Improve', 'Monitor performance and refine processes for continuous improvement.'),
                ];
                return _StepItem(
                  number: '0${index + 1}',
                  title: steps[index].$1,
                  description: steps[index].$2,
                  delay: index * 200,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _StepItem extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final int delay;

  const _StepItem({
    required this.number,
    required this.title,
    required this.description,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Color(0xFF2ECC71), Color(0xFF00D4FF)],
            ).createShader(bounds),
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade400,
                    height: 1.6,
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

class _CTASection extends StatelessWidget {
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
            Color(0xFF2ECC71).withOpacity(0.1),
            Colors.black,
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              Text(
                'Ready To Optimize Your Business Operations?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
              ).animate().fadeIn(duration: 600.ms),
              const SizedBox(height: 24),
              Text(
                'Contact us today for a personalized consultation and see how our solutions can help your business.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.grey.shade400,
                    ),
              ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
              const SizedBox(height: 48),
              _AnimatedButton(
                text: 'Contact Us',
                isPrimary: true,
                onPressed: () => context.goNamed('contact'),
              ).animate().fadeIn(duration: 600.ms, delay: 400.ms).scale(),
            ],
          ),
        ),
      ),
    );
  }
}