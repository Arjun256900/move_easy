// freshhand_card.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimaryBlue = Color(0xFF0A7BDA);
const Color kPrimaryLight = Color(0xFF42A5F5);
const double kCardRadius = 20.0;

class FreshhandCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const FreshhandCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: kPrimaryBlue.withOpacity(0.2),
      child: Column(
        children: [
          ClipRRect(child: Image.asset(imagePath)),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(title), Text(subtitle)],
            ),
          ),
        ],
      ),
    );
  }
}
