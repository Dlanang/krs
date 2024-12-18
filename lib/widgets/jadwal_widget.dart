import 'package:flutter/material.dart';

class JadwalWidget extends StatelessWidget {
  final List<Map<String, String>> jadwal;

  const JadwalWidget({super.key, required this.jadwal});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: jadwal.length,
      itemBuilder: (context, index) {
        var item = jadwal[index];
        return Card(
          child: ListTile(
            title: Text(item['matkul']!),
            subtitle: Text(item['jam']!),
            onTap: () {
              print("Detail Jadwal");
            },
          ),
        );
      },
    );
  }
}
