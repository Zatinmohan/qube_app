import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qube_app/app/HomePage/Controllers/main_page_controller.dart';
import 'package:qube_app/misc/colors.dart';

class FeelingTime extends StatelessWidget {
  const FeelingTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<MainPageController>();
    return SizedBox(
      // color: Colors.black,
      width: context.width,
      height: context.width * 0.3,
      child: ListView.builder(
        itemCount: _controller.totalData,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  _controller.getTime(index),
                  style: const TextStyle(
                    color: primaryTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 20.0),
                Text(
                  _controller.getDataWithTime(index),
                  style: const TextStyle(
                    color: primaryTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
