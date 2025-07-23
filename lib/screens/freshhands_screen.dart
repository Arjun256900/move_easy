import 'package:flutter/material.dart';
import 'package:move_easy/widgets/become_a_partner.dart';
import 'package:move_easy/widgets/freshhand_card.dart';

class FreshhandsScreen extends StatelessWidget {
  FreshhandsScreen({Key? key}) : super(key: key);

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
      'image': 'assets/images/security_systems.jpg',
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fresh Hands Services',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Professional home services for your new place',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.grey[50],
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            // Search bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for services...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 0,
                    ),
                  ),
                ),
              ),
            ),
            // Grid of service cards
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final service = services[index];
                  return FreshhandCard(
                    title: service['title']!,
                    subtitle: service['subtitle']!,
                    imagePath: service['image']!,
                  );
                }, childCount: services.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
              ),
            ),
            // Become a Partner widget at end
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: BecomeAPartner(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
