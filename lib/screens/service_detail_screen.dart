import 'package:flutter/material.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String serviceName;

  const ServiceDetailScreen({super.key, required this.serviceName});

  IconData getServiceIcon() {
    switch (serviceName) {
      case 'GoRide':
        return Icons.motorcycle;
      case 'GoCar':
        return Icons.directions_car;
      case 'GoFood':
        return Icons.fastfood;
      case 'GoSend':
        return Icons.local_shipping;
      case 'GoClean':
        return Icons.cleaning_services;
      case 'History':
        return Icons.history;
      default:
        return Icons.help_outline;
    }
  }

  String getServiceDescription() {
    switch (serviceName) {
      case 'GoRide':
        return 'Layanan ojek motor cepat dan murah 🚀';
      case 'GoCar':
        return 'Mobil nyaman untuk perjalanan Anda 🚗';
      case 'GoFood':
        return 'Pesan makanan favoritmu sekarang! 🍔';
      case 'GoSend':
        return 'Kirim barang cepat & aman 📦';
      case 'GoClean':
        return 'Jasa bersih-bersih rumah & kantor 🧹';
      case 'History':
        return 'Cek riwayat pemesanan kamu di sini 🕒';
      default:
        return 'Layanan tidak ditemukan.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final icon = getServiceIcon();
    final desc = getServiceDescription();

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 240,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Colors.teal],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedScale(
                      duration: const Duration(milliseconds: 400),
                      scale: 1,
                      child: Icon(icon, size: 90, color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      serviceName,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 8,
                    shadowColor: Colors.black26,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(icon, size: 64, color: Colors.green),
                          const SizedBox(height: 20),
                          Text(
                            desc,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Memesan $serviceName...'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.arrow_forward),
                            label: const Text('Lanjutkan'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 36,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 12,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.green),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
