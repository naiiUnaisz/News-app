import 'package:get/get.dart';
import 'package:news_app/controllers/news_controller.dart';


// tempat untuk daftarin binding yang akan digunakan di halaman home, biar ga kepake di halaman lain
// binding punya fungsi wajib yaitu dependencies, yang akan dipanggil saat halaman yang terkait dengan binding ini dibuka
class HomeBinding implements Bindings {
  @override
  void dependencies(){
    // get.lazyPut put biar controller nya cuma dibuat saat dibutuhkan, jadi ga langsung dibuat saat aplikasi dijalankan
    // tapi baru dibuat saat homepage diakses
    Get.lazyPut<NewsController>(() => NewsController());
  }
}