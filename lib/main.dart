import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qube_app/Routes/routes.dart';
import 'package:qube_app/misc/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qube App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: primaryColor,
        ),
        primaryColor: primaryColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
      getPages: Routes.routes,
      initialRoute: '/',
    );
  }
}
