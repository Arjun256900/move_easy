// policy_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class PolicyScreen extends StatefulWidget {
  const PolicyScreen({super.key});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms & Policies')),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Move Easy',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPolicySection(
                      icon: Iconsax.shield_tick,
                      title: 'Our Commitment',
                      content:
                          'Move Easy is committed to providing reliable relocation and home services. We ensure all our service providers are verified professionals with proper background checks.',
                    ),
                    const SizedBox(height: 25),
                    _buildPolicySection(
                      icon: Iconsax.security_safe,
                      title: 'Data Privacy',
                      content:
                          'We respect your privacy and protect your personal information. Your data is securely stored and never shared with third parties without your consent.',
                    ),
                    const SizedBox(height: 25),
                    _buildPolicySection(
                      icon: Iconsax.receipt,
                      title: 'Service Guarantee',
                      content:
                          'All services come with a satisfaction guarantee. If you\'re not happy with the service, we\'ll make it right or provide a refund.',
                    ),
                    const SizedBox(height: 25),
                    _buildPolicySection(
                      icon: Iconsax.money,
                      title: 'Transparent Pricing',
                      content:
                          'No hidden fees or charges. You\'ll see the final price before confirming any service, with all taxes included.',
                    ),
                    const SizedBox(height: 25),
                    _buildPolicySection(
                      icon: Iconsax.support,
                      title: '24/7 Support',
                      content:
                          'Our customer support team is available round the clock to assist you with any queries or issues.',
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: _agreedToTerms,
                  onChanged: (value) => setState(() => _agreedToTerms = value!),
                  activeColor: const Color(0xFF0A7BDA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'I agree to the ',
                      style: GoogleFonts.poppins(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Terms of Service',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF0A7BDA),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF0A7BDA),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: _agreedToTerms
                    ? () => Navigator.pushReplacementNamed(context, '/home')
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A7BDA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Get Started',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicySection({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF0A7BDA).withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, size: 28, color: const Color(0xFF0A7BDA)),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                content,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
