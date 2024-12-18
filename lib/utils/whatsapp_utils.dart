import 'package:url_launcher/url_launcher.dart';

Future<void> openWhatsApp() async {
  final String phoneNumber = "+628123456789"; // Ganti dengan nomor WhatsApp Anda
  final Uri url = Uri.parse("https://wa.me/$phoneNumber");

  try {
    // Menggunakan launchUrl dan memastikan bahwa url adalah Uri
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Tidak dapat membuka WhatsApp.';
    }
  } catch (e) {
    print('Error: $e');
  }
}
