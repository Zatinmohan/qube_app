import 'package:get/get.dart';
import 'package:qube_app/app/HomePage/Controllers/main_page_controller.dart';

class MainPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(() => MainPageController());
  }
}
