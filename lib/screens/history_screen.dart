import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<Map<String, String>> history = [
    {
      'service': 'GoRide',
      'date': '20 Juni 2025',
      'destination': 'Jl. Merdeka No.10',
    },
    {
      'service': 'GoFood',
      'date': '18 Juni 2025',
      'destination': 'Ayam Geprek Pak Gembus',
    },
    {
      'service': 'GoSend',
      'date': '15 Juni 2025',
      'destination': 'Toko Buku Gramedia',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pemesanan'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: history.length,
        itemBuilder: (context, index) {
          final item = history[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.history, color: Colors.green),
              title: Text('${item['service']} - ${item['destination']}'),
              subtitle: Text('${item['date']}'),
            ),
          );
        },
      ),
    );
  }
}
