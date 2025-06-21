import 'package:flutter/material.dart';
import '../widgets/service_card.dart';
import '../widgets/promo_banner.dart';
import 'profile_screen.dart';
import 'service_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> services = const [
    {'name': 'GoRide', 'icon': Icons.motorcycle},
    {'name': 'GoCar', 'icon': Icons.directions_car},
    {'name': 'GoFood', 'icon': Icons.fastfood},
    {'name': 'GoSend', 'icon': Icons.local_shipping},
    {'name': 'GoClean', 'icon': Icons.cleaning_services},
    {'name': 'History', 'icon': Icons.history},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Halo, Suterisno 👋',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mau pergi ke mana hari ini?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              itemCount: services.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                final service = services[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ServiceDetailScreen(
                          serviceName: service['name'],
                        ),
                      ),
                    );
                  },
                  child: ServiceCard(
                    name: service['name'],
                    icon: service['icon'],
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            const PromoBanner(
              title: '🎉 Promo Spesial GoFood!',
              description: 'Diskon 50% untuk pengguna baru. Buruan coba!',
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: const [
                  Icon(Icons.info, color: Colors.green),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Jangan lupa pakai helm dan masker saat bepergian ya!',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
