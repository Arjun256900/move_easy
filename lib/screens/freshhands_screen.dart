// freshhands_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_easy/widgets/freshhand_card.dart';

const Color kPrimaryBlue = Color(0xFF0A7BDA);
const Color kPrimaryLight = Color(0xFF42A5F5);

class FreshhandsScreen extends StatefulWidget {
  const FreshhandsScreen({super.key});

  @override
  State<FreshhandsScreen> createState() => _FreshhandsScreenState();
}

class _FreshhandsScreenState extends State<FreshhandsScreen> {
  final List<Map<String, String>> services = [
    {
      'title': 'House Cleaning',
      'subtitle': 'Deep cleaning for your home',
      'image': 'assets/images/home_cleaning.png',
    },
    {
      'title': 'Pest Control',
      'subtitle': 'Get rid of pests and insects',
      'image': 'assets/images/pests_control.jpg',
    },
    {
      'title': 'Electrician',
      'subtitle': 'Electrical repairs and installations',
      'image': 'assets/images/electrician.png',
    },
    {
      'title': 'Plumbing',
      'subtitle': 'Fix leaks and plumbing issues',
      'image': 'assets/images/plumber.png',
    },
    {
      'title': 'AC Technician',
      'subtitle': 'AC installation and servicing',
      'image': 'assets/images/ac_technician.jpg',
    },
    {
      'title': 'Carpenter',
      'subtitle': 'Furniture assembly and repair',
      'image': 'assets/images/carpenter.jpg',
    },
    {
      'title': 'Internet Setup',
      'subtitle': 'WiFi and broadband installation',
      'image': 'assets/images/internet_setup.jpg',
    },
    {
      'title': 'Appliance Setup',
      'subtitle': 'Home appliance installation',
      'image': 'assets/images/appliance_setup.jpg',
    },
    {
      'title': 'Locksmith',
      'subtitle': 'Lock installation and key duplication',
      'image': 'assets/images/lock_smith.jpg',
    },
    {
      'title': 'Security Systems',
      'subtitle': 'CCTV and security installation',
      'image': 'assets/images/security_systems.png',
    },
    {
      'title': 'Furniture Moving',
      'subtitle': 'Furniture arrangement',
      'image': 'assets/images/furniture_moving.jpg',
    },
    {
      'title': 'Interior Design',
      'subtitle': 'Home décor and organization',
      'image': 'assets/images/interior_design.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fresh Hand Services',
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 3),
            Text(
              'Professional home services for your new page',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.withOpacity(0.92),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search services...',
                  hintStyle: GoogleFonts.poppins(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.search, color: kPrimaryBlue),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75, // Adjusted for text wrapping
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) => FreshhandCard(
                  title: services[index]['title']!,
                  subtitle: services[index]['subtitle']!,
                  imagePath: services[index]['image']!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
