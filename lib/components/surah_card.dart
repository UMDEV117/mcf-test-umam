import 'package:flutter/material.dart';

class SurahCard extends StatelessWidget {
  final Map<String, dynamic> surah;
  final VoidCallback onTap;

  const SurahCard({super.key, required this.surah, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(surah['namaLatin']),
        subtitle: Text(surah['arti']),
        leading: CircleAvatar(
          child: Text(surah['nomor'].toString()),
        ),
        onTap: onTap,
      ),
    );
  }
}
