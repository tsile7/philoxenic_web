import 'package:flutter/material.dart';
import 'package:philoxenic_web/core/widgets/global_footer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
            _HeroSection(),
            _ContactFormSection(),
            _ContactInfoSection(),
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
      height: MediaQuery.of(context).size.height * 0.6,
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
                    'CONTACT US',
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
                  'Talk to Philoxenic',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0),
                const SizedBox(height: 24),
                Text(
                  'Let us help you scale with enterprise-grade SaaS, web and mobile solutions. Our team is ready to discuss your project.',
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

class _ContactFormSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      color: Color(0xFF0a0a0a),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 900) {
                return Column(
                  children: [
                    _FormCard(),
                    const SizedBox(height: 48),
                    _BenefitsCard(),
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: _FormCard()),
                  const SizedBox(width: 48),
                  Expanded(flex: 2, child: _BenefitsCard()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FormCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2ECC71).withOpacity(0.05),
            Colors.transparent,
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: const _ContactForm(),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0);
  }
}

class _ContactForm extends StatelessWidget {
  const _ContactForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Request a Demo',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Fill out the form below and we\'ll get back to you within 24 hours.',
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 40),
        _CustomTextField(
          labelText: 'Full Name *',
          hintText: 'Name & Surname',
        ),
        const SizedBox(height: 24),
        _CustomTextField(
          labelText: 'Work Email *',
          hintText: 'john@company.com',
        ),
        const SizedBox(height: 24),
        _CustomTextField(
          labelText: 'Company Name *',
          hintText: 'Your Company',
        ),
        const SizedBox(height: 24),
        _CustomTextField(
          labelText: 'Phone Number',
          hintText: '+27 XX XXX XXXX',
        ),
        const SizedBox(height: 24),
        _CustomDropdown(),
        const SizedBox(height: 24),
        _CustomTextField(
          labelText: 'Message *',
          hintText: 'Tell us about your project...',
          maxLines: 4,
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: _GradientButton(
            text: 'Request Demo',
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'By submitting this form, you agree to our Privacy Policy.',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

class _CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final int maxLines;

  const _CustomTextField({
    required this.labelText,
    required this.hintText,
    this.maxLines = 1,
  });

  @override
  State<_CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<_CustomTextField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focused) => setState(() => _isFocused = focused),
      child: TextField(
        maxLines: widget.maxLines,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          labelStyle: TextStyle(
            color: _isFocused ? Color(0xFF2ECC71) : Colors.grey.shade500,
          ),
          hintStyle: TextStyle(color: Colors.grey.shade700),
          filled: true,
          fillColor: Colors.grey.shade900.withOpacity(0.3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade800),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade800),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFF2ECC71), width: 2),
          ),
          contentPadding: const EdgeInsets.all(20),
        ),
      ),
    );
  }
}

class _CustomDropdown extends StatefulWidget {
  const _CustomDropdown();

  @override
  State<_CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<_CustomDropdown> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedValue,
      dropdownColor: Colors.grey.shade900,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'I\'m interested in *',
        labelStyle: TextStyle(color: Colors.grey.shade500),
        filled: true,
        fillColor: Colors.grey.shade900.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade800),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade800),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF2ECC71), width: 2),
        ),
        contentPadding: const EdgeInsets.all(20),
      ),
      items: const [
        DropdownMenuItem(
          value: 'custom',
          child: Text('Custom Software Development'),
        ),
        DropdownMenuItem(
          value: 'mobile',
          child: Text('Web & Mobile Application Solutions'),
        ),
        DropdownMenuItem(
          value: 'business',
          child: Text('Business Systems & Automation'),
        ),
        DropdownMenuItem(
          value: 'ux',
          child: Text('UX/UI Design & Digital Experience'),
        ),
        DropdownMenuItem(
          value: 'consulting',
          child: Text('IT Consulting Services & Support'),
        ),
      ],
      onChanged: (value) => setState(() => _selectedValue = value),
    );
  }
}

class _GradientButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const _GradientButton({
    required this.text,
    required this.onPressed,
  });

  @override
  State<_GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<_GradientButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2ECC71), Color(0xFF00D4FF)],
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Color(0xFF2ECC71).withOpacity(0.5),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              widget.text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BenefitsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Why Work With Us?',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
        ),
        const SizedBox(height: 32),
        _BenefitItem(
          icon: Icons.rocket_launch,
          title: 'Fast Implementation',
          description: 'Get started quickly with our proven development process',
          delay: 0,
        ),
        const SizedBox(height: 24),
        _BenefitItem(
          icon: Icons.support_agent,
          title: 'Dedicated Support',
          description: '24/7 support team to help you succeed',
          delay: 100,
        ),
        const SizedBox(height: 24),
        _BenefitItem(
          icon: Icons.trending_up,
          title: 'Scalable Solutions',
          description: 'Built to grow with your business needs',
          delay: 200,
        ),
        const SizedBox(height: 24),
        _BenefitItem(
          icon: Icons.security,
          title: 'Enterprise Security',
          description: 'Bank-level security and compliance standards',
          delay: 300,
        ),
      ],
    ).animate().fadeIn(duration: 600.ms, delay: 200.ms);
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFF2ECC71).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 24, color: Color(0xFF2ECC71)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  fontSize: 14,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay))
        .slideX(begin: 0.2, end: 0);
  }
}

class _ContactInfoSection extends StatelessWidget {
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
                  'OTHER WAYS TO REACH US',
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
                'Get in Touch',
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
                childAspectRatio: 1.3,
                children: [
                  _ContactInfoCard(
                    icon: Icons.email_outlined,
                    title: 'Email Us',
                    content: 'info@philoxenic.co.za',
                    description: 'We typically respond within 24 hours',
                    delay: 0,
                  ),
                  _ContactInfoCard(
                    icon: Icons.phone_outlined,
                    title: 'Call Us',
                    content: '+27 81 781 9256',
                    description: 'Mon-Fri from 9am to 4pm SAST',
                    delay: 200,
                  ),
                  _ContactInfoCard(
                    icon: Icons.location_on_outlined,
                    title: 'Visit Us',
                    content: 'Pretoria, South Africa',
                    description: 'Remote-first company',
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

class _ContactInfoCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String content;
  final String description;
  final int delay;

  const _ContactInfoCard({
    required this.icon,
    required this.title,
    required this.content,
    required this.description,
    required this.delay,
  });

  @override
  State<_ContactInfoCard> createState() => _ContactInfoCardState();
}

class _ContactInfoCardState extends State<_ContactInfoCard> {
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
              child: Icon(widget.icon, size: 32, color: Color(0xFF2ECC71)),
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF2ECC71),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade500,
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