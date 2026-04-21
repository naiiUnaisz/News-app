
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:news_app/bindings/app_binding.dart';
import 'package:news_app/routes/app_pages.dart';

// buat daftarin Api key nya di .env, terus kita panggil di news service buat ngambil data dari api
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: AppPages.INITIAL, //halaman awal yang akan ditampilkan saat aplikasi dijalankan, diambil dari AppPages.INITIAL yang sudah didefinisikan di app_pages.dart
      getPages: AppPages.routes, // daftar halaman yang ada di app, setiap halaman punya nama,
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
       // binding yang dijalankan saat aplikasi dijalankan, diambil dari AppBinding yang sudah didefinisikan di app_binding.dart, binding ini akan memastikan bahwa semua dependencies yang dibutuhkan oleh halaman yang akan ditampilkan sudah siap sebelum halaman tersebut ditampilkan
    );
  }
}