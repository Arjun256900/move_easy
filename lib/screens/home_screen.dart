import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:move_easy/screens/account_screen.dart';
import 'package:move_easy/screens/bookings_screen.dart';
import 'package:move_easy/screens/freshhands_screen.dart';
import 'package:move_easy/screens/partner_screen.dart';

const Color kPrimaryBlue = Color(0xFF0A7BDA);
const Color kPrimaryLight = Color(0xFF42A5F5);
const double kCardRadius = 20.0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeTab(),
    const FreshhandsScreen(),
    const PartnerScreen(),
    const BookingsScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _screens),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: kPrimaryBlue,
          unselectedItemColor: Colors.grey.shade600,
          selectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
          unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == 0 ? Iconsax.home_15 : Iconsax.home,
                size: 24,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == 1 ? Iconsax.flash_15 : Iconsax.flash,
                size: 24,
              ),
              label: 'Fresh Hands',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == 2 ? Icons.handshake : Icons.handshake_outlined,
                size: 24,
              ),
              label: 'Partner',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == 3
                    ? Icons.date_range_outlined
                    : Icons.date_range,
                size: 24,
              ),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == 4
                    ? Iconsax.profile_circle5
                    : Iconsax.profile_circle,
                size: 24,
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}

// Home Tab
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, Rohan!',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: kPrimaryBlue,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            'What service do you need today?',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 30),
          _buildPromoCard(),
          const SizedBox(height: 30),
          Text(
            'Services',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(right: 20),
              children: [
                _buildServiceItem(
                  Iconsax.truck,
                  'Relocation',
                  'assets/images/relocation.png',
                  'Helping you relocate across cities',
                ),
                _buildServiceItem(
                  Iconsax.home,
                  'Home Cleaning',
                  'assets/images/home_cleaning.png',
                  'He who cleans expects visitors',
                ),
                _buildServiceItem(
                  Iconsax.flash_circle,
                  'Electrician',
                  'assets/images/electrician.png',
                  'Lights out? Never again.',
                ),
                _buildServiceItem(
                  Iconsax.drop,
                  'Plumber',
                  'assets/images/plumber.png',
                  'Slippery floors? Better fix it before the mighty fall',
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Rated Professionals',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 200,
            child: ListView(
              padding: const EdgeInsets.only(right: 20),
              scrollDirection: Axis.horizontal,
              children: const [
                ProfessionalCard(
                  name: 'Arun Kumar',
                  rating: 4.9,
                  service: 'Relocation',
                ),
                ProfessionalCard(
                  name: 'Priya Sharma',
                  rating: 4.8,
                  service: 'Cleaning',
                ),
                ProfessionalCard(
                  name: 'Vikram Singh',
                  rating: 4.7,
                  service: 'Electrician',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0A7BDA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/moving_truck.png',
                  width: double.infinity,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Premium Relocation Package',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Get 30% off on your first relocation service',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Book Now',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0A7BDA),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem(
    IconData icon,
    String title,
    String imagePath,
    String subtitle,
  ) {
    return SizedBox(
      width: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kCardRadius),
        ),
        elevation: 4,
        shadowColor: kPrimaryBlue.withOpacity(0.2),
        color: Colors.white,
        child: Stack(
          children: [
            // Icon & title at the top
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryBlue,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Image at bottom-right
            Positioned(
              bottom: 8,
              right: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder professional card
class ProfessionalCard extends StatelessWidget {
  final String name;
  final double rating;
  final String service;
  const ProfessionalCard({
    super.key,
    required this.name,
    required this.rating,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: kPrimaryBlue.withOpacity(0.1),
            child: Icon(Iconsax.profile_circle, color: kPrimaryBlue),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            service,
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
          ),
          const Spacer(),
          Row(
            children: [
              Icon(Iconsax.star, size: 16, color: kPrimaryLight),
              const SizedBox(width: 4),
              Text(rating.toString(), style: GoogleFonts.poppins(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
