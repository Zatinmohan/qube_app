import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qube_app/app/HomePage/Controllers/main_page_controller.dart';
import 'package:qube_app/app/HomePage/Widgets/Date%20List/date_list_main.dart';
import 'package:qube_app/app/HomePage/Widgets/Feeling%20Meter/feeling_meter_main.dart';
import 'package:qube_app/app/HomePage/Widgets/Feeling%20Time/feeling_time_main.dart';
import 'package:qube_app/app/HomePage/Widgets/Interesting/interesting_main.dart';
import 'package:qube_app/misc/colors.dart';

class HomePage extends GetView<MainPageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Your Feeling History",
          style: TextStyle(color: primaryTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: controller.obx(
              (state) => Column(
                    children: const [
                      SizedBox(height: 20.0),
                      FeelingMeter(),
                      SizedBox(height: 20.0),
                      Divider(height: 1.0, color: primaryTextColor),
                      SizedBox(height: 20.0),
                      DateList(),
                      SizedBox(height: 20.0),
                      Divider(height: 1.0, color: primaryTextColor),
                      SizedBox(height: 20.0),
                      FeelingTime(),
                      SizedBox(height: 20.0),
                      Divider(height: 1.0, color: primaryTextColor),
                      SizedBox(height: 20.0),
                      InterestingPart(),
                    ],
                  ),
              onEmpty: Text(
                "Please Check your internet Connection!",
                style: TextStyle(
                  color: primaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: context.width * 0.1,
                ),
              ),
              onError: (error) => Text(
                    "Please Check your internet Connection!",
                    style: TextStyle(
                      color: primaryTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: context.width * 0.1,
                    ),
                  )),
        ),
      ),
    );
  }
}
