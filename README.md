Presentasi Pengembangan Aplikasi KRS: Breakdown dan Peluang Kustomisasi
Tujuan Aplikasi:
Aplikasi ini dirancang untuk mempermudah mahasiswa dalam mengelola Kartu Rencana Studi (KRS) mereka, memungkinkan untuk login, melihat jadwal kuliah, menambah dan menghapus mata kuliah, serta melihat data KRS di dashboard.

1. Komponen Utama Aplikasi
A. Halaman Login (LoginPage)
Tujuan: Halaman ini menerima input nama dan NIM dari pengguna (mahasiswa). Setelah login, data disimpan menggunakan SharedPreferences untuk penggunaan yang lebih lanjut, dan aplikasi mengarahkan pengguna ke halaman Dashboard.

Fungsi Utama:

Input Nama & NIM: Menggunakan TextEditingController untuk menangkap input pengguna.

Navigasi ke Dashboard: Setelah login berhasil, data pengguna dan list KRS dikirim ke halaman DashboardPage menggunakan Navigator.pushReplacement().

Pengelolaan Data KRS: Setiap login akan menyertakan data KRS (bisa kosong atau diisi), dan mengalihkan kontrol ke halaman Dashboard yang menampilkan dan mengelola data KRS.

Tantangan:

Menjaga konsistensi data di antara berbagai halaman.

Mengoptimalkan UI agar responsif di perangkat mobile dan desktop.

B. Dashboard (DashboardPage)
Tujuan: Menampilkan data KRS (mata kuliah yang telah dipilih oleh mahasiswa), memungkinkan mahasiswa untuk menambah atau menghapus mata kuliah mereka.

Fungsi Utama:

Menampilkan Data KRS: KRS ditampilkan dalam bentuk ListView dengan setiap item dalam daftar menunjukkan mata kuliah, jam, dan dosen.

Tambah & Hapus KRS: Fungsi untuk menambah atau menghapus mata kuliah yang disimpan dalam krsList.

Interaksi dengan Jadwal Kuliah: Mahasiswa dapat memilih mata kuliah dan melihat detailnya, serta menambahkannya ke KRS mereka.

Tantangan:

Memastikan pembaruan data yang terjadi di halaman ini langsung tercermin di halaman lain, seperti JadwalPage.

Mengelola state dengan efisien saat pengguna menambah/menghapus KRS dan melakukan perubahan UI secara dinamis.

C. Halaman Jadwal (JadwalPage)
Tujuan: Menampilkan daftar jadwal kuliah mahasiswa berdasarkan data yang dikirimkan dari DashboardPage.

Fungsi Utama:

Menampilkan Jadwal Kuliah: Menggunakan ListView.builder untuk menampilkan data dalam bentuk Card yang mudah dibaca.

Interaksi: Pengguna dapat memilih jadwal kuliah untuk melihat detailnya, namun tidak ada aksi lebih lanjut di halaman ini selain untuk melihat informasi.

Tantangan:

Menjaga data tetap up-to-date dan sinkron antara halaman JadwalPage dan DashboardPage.

Membuat tampilan jadwal yang responsif dan mudah digunakan di perangkat mobile.

2. Komponen Kustomisasi UI & UX
A. Desain Antarmuka (UI)
Minimalis dan Bersih: Setiap halaman didesain dengan fokus pada fungsionalitas. Misalnya, halaman login menggunakan TextField dengan ikon untuk input nama dan NIM, serta tombol login yang jelas. Responsif: Menggunakan layout yang fleksibel agar aplikasi dapat menyesuaikan dengan berbagai ukuran layar, baik di perangkat mobile maupun desktop. Estetika: Desain menggunakan warna-warna yang konsisten seperti blueAccent untuk memberi kesan profesional namun tetap menarik.
B. User Experience (UX)
Akses Mudah: Semua elemen penting dapat diakses dengan mudah oleh pengguna. Misalnya, tombol "Masuk" di halaman login dan tombol untuk menambah atau menghapus KRS di dashboard sangat jelas. Feedback Pengguna: Menggunakan elemen visual seperti Snackbar atau AlertDialog untuk memberi feedback saat KRS ditambah atau dihapus. Navigasi yang Efisien: Pengguna dapat berpindah antara halaman tanpa kehilangan status aplikasi. Navigasi dilakukan menggunakan Navigator.pushReplacement() untuk login dan mengarahkan ke halaman Dashboard, serta navigasi antar halaman menggunakan Named Routes atau MaterialPageRoute.
3. Manajemen Data dan State
A. State Management dengan StatefulWidget
LoginPage dan DashboardPage adalah StatefulWidget karena mereka mengelola data dinamis seperti input pengguna dan daftar KRS. Setiap perubahan dalam state memicu pembaruan UI, misalnya saat KRS ditambahkan atau dihapus. SharedPreferences digunakan untuk menyimpan data secara lokal sehingga saat aplikasi dibuka kembali, data seperti nama dan NIM tetap ada tanpa harus login ulang.
B. Kustomisasi Data
KRS List: Daftar KRS disimpan dalam list of maps yang berisi data tentang mata kuliah yang diambil, termasuk nama matkul, hari, dosen, dan jam kuliah. Tambah & Hapus KRS: Dengan menggunakan setState() di _DashboardPageState, data KRS dapat ditambah atau dihapus sesuai dengan interaksi pengguna.
C. Penggunaan SharedPreferences
Data pengguna seperti nama dan NIM disimpan di SharedPreferences agar tetap tersedia saat aplikasi dijalankan kembali.
4. Potensi Kustomisasi dan Ekspansi Aplikasi
A. Penggunaan Bahasa Pemrograman Lain
Backend (Server-Side):
Jika aplikasi berkembang dan membutuhkan scalability lebih besar, kita dapat memindahkan backend ke bahasa pemrograman seperti Node.js, Python (Django), atau Spring Boot untuk menangani lebih banyak pengguna, dan mengintegrasikan sistem lain seperti Sistem Informasi Akademik Universitas.

Frontend (Mobile / Web):
Aplikasi yang dikembangkan dengan Flutter sudah memungkinkan untuk porting ke Android dan iOS, namun jika diperlukan, kita bisa beralih ke React Native untuk cross-platform mobile development atau menggunakan Angular/React untuk membuat aplikasi web yang terhubung ke backend.

Web Integration:
Untuk menyediakan akses dari perangkat desktop atau browser, aplikasi ini bisa dibangun ulang atau disesuaikan untuk Web App menggunakan React atau Angular, dengan menghubungkan aplikasi ke backend menggunakan REST API atau GraphQL.

B. Fitur Tambahan
Notifikasi Real-time:
Menambahkan kemampuan push notification untuk memberi tahu mahasiswa jika ada perubahan jadwal kuliah atau jika KRS mereka sudah diterima.

Integrasi dengan Sistem Lain:
Mengintegrasikan aplikasi ini dengan sistem lain seperti Learning Management Systems (LMS), atau Sistem Akademik Universitas untuk memberikan fitur seperti melihat nilai, mendaftar ujian, atau mengakses materi kuliah.

Autentikasi & Keamanan:
Memperkenalkan fitur two-factor authentication (2FA) atau menggunakan penyedia autentikasi seperti Firebase Authentication untuk meningkatkan keamanan aplikasi.

Analitik & Statistik:
Menambahkan fitur analitik untuk melacak penggunaan aplikasi, seperti jumlah mata kuliah yang diambil, waktu login, atau statistik umum terkait kegiatan mahasiswa.

Offline Mode:
Dengan menggunakan Firebase Firestore atau SQLite, kita dapat membuat aplikasi yang dapat berfungsi offline, memungkinkan mahasiswa mengakses jadwal kuliah dan KRS meskipun tidak terhubung ke internet.

5. Kesimpulan
Aplikasi KRS yang kita kembangkan menggunakan Flutter telah memenuhi berbagai kebutuhan dasar mahasiswa dalam mengelola KRS mereka. Aplikasi ini memiliki antarmuka yang sederhana namun fungsional, mampu menambahkan dan menghapus mata kuliah, serta menampilkan jadwal kuliah dengan efisien.

Dengan berbagai peluang kustomisasi dan pengembangan lebih lanjut, baik pada sisi frontend maupun backend, aplikasi ini memiliki potensi untuk berkembang menjadi platform yang lebih besar dan lebih kompleks, baik untuk penggunaan individu maupun institusi.

Peluang untuk scalability, keamanan, dan integrasi dengan sistem lain sangat besar, memungkinkan aplikasi ini untuk menjadi solusi yang lebih komprehensif dalam pengelolaan akademik mahasiswa.

Terima kasih atas perhatian Anda. Saya siap untuk menjawab pertanyaan lebih lanjut.