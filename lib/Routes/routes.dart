import 'package:get/get.dart';
import 'package:qube_app/app/HomePage/Bindings/main_page_bindings.dart';
import 'package:qube_app/app/HomePage/home_main.dart';

class Routes {
  static final routes = [
    GetPage(
        name: '/', page: () => const HomePage(), binding: MainPageBindings()),
  ];
}
