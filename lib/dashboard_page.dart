import 'package:flutter/material.dart';
import 'login_page.dart';
import 'jadwal_page.dart';  // Menambahkan import untuk JadwalPage
import '../widgets/jadwal_widget.dart';  // Import JadwalWidget

class DashboardPage extends StatefulWidget {
  final String nama;
  final String nim;
  // Tidak perlu parameter krsList di constructor, kita akan menggunakan stateful widget
  const DashboardPage({
    super.key,
    required this.nama,
    required this.nim,
  });

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Map<String, String>> krsList = [];  // Menyimpan data KRS

  // Fungsi untuk menambah KRS
  void tambahKRS(Map<String, String> newKRS) {
    setState(() {
      krsList.add(newKRS);  // Menambahkan KRS ke dalam list
    });
  }

  // Fungsi untuk menghapus KRS
  void hapusKRS(int index) {
    setState(() {
      krsList.removeAt(index);  // Menghapus KRS berdasarkan index
    });
  }

  // Fungsi untuk menampilkan dialog tambah KRS
  void _tampilkanDialogTambahKRS(BuildContext context) {
    final TextEditingController _matkulController = TextEditingController();
    final TextEditingController _hariController = TextEditingController();
    final TextEditingController _dosenController = TextEditingController();
    final TextEditingController _jamController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tambah KRS'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _matkulController,
                decoration: InputDecoration(labelText: 'Nama Mata Kuliah'),
              ),
              TextField(
                controller: _hariController,
                decoration: InputDecoration(labelText: 'Hari'),
              ),
              TextField(
                controller: _dosenController,
                decoration: InputDecoration(labelText: 'Nama Dosen'),
              ),
              TextField(
                controller: _jamController,
                decoration: InputDecoration(labelText: 'Jam Perkuliahan'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_matkulController.text.isNotEmpty &&
                    _hariController.text.isNotEmpty &&
                    _dosenController.text.isNotEmpty &&
                    _jamController.text.isNotEmpty) {
                  final newKRS = {
                    'matkul': _matkulController.text,
                    'hari': _hariController.text,
                    'dosen': _dosenController.text,
                    'jam': _jamController.text,
                  };
                  tambahKRS(newKRS);  // Menambahkan KRS
                  Navigator.pop(context);  // Tutup dialog
                }
              },
              child: Text('Tambah'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LoginPage()),
            );
          },
        ),
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Selamat datang, ${widget.nama}', style: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(height: 20),
            Text('NIM: ${widget.nim}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => JadwalPage(jadwalKuliah: krsList),  // Mengirim krsList ke JadwalPage
                  ),
                );
              },
              child: Text('Lihat Jadwal Kuliah'),
            ),
            SizedBox(height: 20),
            JadwalWidget(jadwal: krsList),  // Menampilkan KRS yang ada
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Daftar KRS:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  krsList.isEmpty
                      ? Center(child: Text('Belum ada KRS yang ditambahkan'))
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: krsList.length,
                          itemBuilder: (context, index) {
                            var krs = krsList[index];
                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                title: Text(krs['matkul']!),
                                subtitle: Text(
                                  'Hari: ${krs['hari']!}\nDosen: ${krs['dosen']!}\nJam: ${krs['jam']!}',
                                  style: TextStyle(fontSize: 14),
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    hapusKRS(index);  // Menghapus KRS
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _tampilkanDialogTambahKRS(context);  // Menggunakan dialog untuk tambah KRS
            },
            child: Icon(Icons.add),
            tooltip: "Tambah KRS",
          ),
        ],
      ),
    );
  }
}
