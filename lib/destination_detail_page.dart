import 'package:flutter/material.dart';
import 'models/destination_model.dart';

class DestinationDetailPage extends StatelessWidget {
  final Destination destination;

  DestinationDetailPage({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(destination.name)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                destination.imageUrl,
                width: MediaQuery.of(context).size.width * 0.9,
                height: 200,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  destination.description,
                  style: TextStyle(fontSize: 16.0),
                  textAlign:
                      TextAlign.justify, // Mengatur teks agar rata kanan kiri
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Pesan Tiket'),
                        content: Text(
                            'Tiket ke ${destination.name} berhasil dipesan!'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('Pesan Tiket'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
