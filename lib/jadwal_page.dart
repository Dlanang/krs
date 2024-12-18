import 'package:flutter/material.dart';

class JadwalPage extends StatelessWidget {
  final List<Map<String, String>> jadwalKuliah;

  const JadwalPage({super.key, required this.jadwalKuliah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jadwal Kuliah')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: jadwalKuliah.isEmpty
            ? Center(child: Text('Tidak ada jadwal kuliah'))
            : ListView.builder(
                itemCount: jadwalKuliah.length,
                itemBuilder: (context, index) {
                  var jadwal = jadwalKuliah[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(jadwal['matkul']!),
                      subtitle: Text(
                        'Hari: ${jadwal['hari']!}\nDosen: ${jadwal['dosen']!}\nJam: ${jadwal['jam']!}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
