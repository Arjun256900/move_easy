import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimaryBlue = Color(0xFF0A7BDA);
const Color kPrimaryLight = Color(0xFF42A5F5);

class PartnerScreen extends StatefulWidget {
  const PartnerScreen({super.key});

  @override
  State<PartnerScreen> createState() => _PartnerScreenState();
}

class _PartnerScreenState extends State<PartnerScreen> {
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Become a partner',
              style: GoogleFonts.poppins(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: kPrimaryBlue,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Before you proceed to apply to work as a partner with us, please read the terms and agreements to the end.',
              style: GoogleFonts.poppins(
                color: Colors.grey.withOpacity(0.94),
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Terms and Agreements',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: kPrimaryBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBulletPoint(
                      "You must be at least 18 years old to register as a service partner.",
                    ),
                    _buildBulletPoint(
                      "You are expected to maintain professional behavior during all service requests.",
                    ),
                    _buildBulletPoint(
                      "Any damage caused during service must be reported immediately and will be assessed for liability.",
                    ),
                    _buildBulletPoint(
                      "You must adhere to local government laws and safety regulations while performing tasks.",
                    ),
                    _buildBulletPoint(
                      "Partners are independent contractors and not employees of the company.",
                    ),
                    _buildBulletPoint(
                      "Your account may be suspended or terminated for fraudulent behavior or repeated poor customer feedback.",
                    ),
                    _buildBulletPoint(
                      "Payments will be processed weekly via your registered bank account.",
                    ),
                    _buildBulletPoint(
                      "You agree to wear proper attire and maintain hygiene when attending customer premises.",
                    ),
                    _buildBulletPoint(
                      "All tools or equipment used should be in working condition and safe for use.",
                    ),
                    _buildBulletPoint(
                      "You are responsible for maintaining accurate service availability and accepting jobs in a timely manner.",
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: kPrimaryBlue,
                          value: _isAgreed,
                          onChanged: (val) {
                            setState(() {
                              _isAgreed = val ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            'I have read and agree to the Terms and Agreements.',
                            style: GoogleFonts.poppins(fontSize: 13.5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isAgreed
                            ? () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "You may now proceed to apply as a partner.",
                                    ),
                                  ),
                                );
                                // Navigator.push(...)
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryBlue,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Continue',
                          style: GoogleFonts.poppins(
                            fontSize: 15.5,
                            color: Colors.white,
                          ),
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
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "\u2022  ",
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
          ),
          Expanded(child: Text(text, style: GoogleFonts.poppins(fontSize: 14))),
        ],
      ),
    );
  }
}
