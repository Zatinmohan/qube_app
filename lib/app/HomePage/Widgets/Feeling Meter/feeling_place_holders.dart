import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qube_app/Model/feeling_list_model.dart';
import 'package:qube_app/app/HomePage/Controllers/main_page_controller.dart';
import 'package:qube_app/misc/colors.dart';

class FeelingCards extends StatelessWidget {
  const FeelingCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: feelingList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      FeelingCardWidget(index: index),
                      FeelingIconWidget(index: index),
                    ],
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      feelingList[index].name,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontSize: context.width * 0.04,
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}

class FeelingIconWidget extends StatelessWidget {
  final int index;
  const FeelingIconWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      child: Container(
        width: context.width * 0.17,
        height: context.width * 0.16,
        decoration: const BoxDecoration(
          color: moodGreenColor,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          feelingList[index].image,
        ),
      ),
    );
  }
}

class FeelingCardWidget extends StatelessWidget {
  final int index;
  const FeelingCardWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<MainPageController>();
    return SizedBox(
      width: context.width * 0.17,
      height: context.width * 0.35,
      child: Card(
        elevation: 2.0,
        color: moodCardColor.withOpacity(0.6),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "${_controller.getPercentageValue(index)}%",
              style: TextStyle(
                color: primaryTextColor.withOpacity(0.5),
                fontSize: context.width * 0.042,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
