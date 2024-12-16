import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  final List<Map<String, String>> surahList = const [
    {'name': 'Al-Fatihah', 'number': '1'},
    {'name': 'Al-Baqarah', 'number': '2'},
    {'name': 'Al-Imran', 'number': '3'},
    {'name': 'An-Nisa', 'number': '4'},
    {'name': 'Al-Maidah', 'number': '5'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quran Dashboard'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Daftar Surat',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: surahList.length,
              itemBuilder: (context, index) {
                final surah = surahList[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(surah['name']!),
                    leading: CircleAvatar(
                      child: Text(surah['number']!),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SurahDetailScreen(
                            surahName: surah['name']!,
                            surahNumber: surah['number']!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SurahDetailScreen extends StatelessWidget {
  final String surahName;
  final String surahNumber;

  const SurahDetailScreen({
    super.key,
    required this.surahName,
    required this.surahNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surahName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Surat $surahName',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Isi surat Al-Quran dengan nomor surat $surahNumber akan ditampilkan di sini.',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
