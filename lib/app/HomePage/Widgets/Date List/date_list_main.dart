import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qube_app/app/HomePage/Controllers/main_page_controller.dart';
import 'package:qube_app/misc/colors.dart';

class DateList extends StatelessWidget {
  const DateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<MainPageController>();
    return SizedBox(
      // color: Colors.black,
      height: context.width * 0.4,
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            height: context.width * 0.1,
            width: context.width * 0.25,
            decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10.0)),
            child: FittedBox(
                child: Obx(
              () => Text(
                _controller.finalDate.value,
                style: TextStyle(
                  color: primaryTextColor,
                  fontSize: context.width * 0.08,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
          ),
          const SizedBox(height: 8.0),
          const DatePlaceHolderWidget()
        ],
      ),
    );
  }
}

class DatePlaceHolderWidget extends StatelessWidget {
  const DatePlaceHolderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<MainPageController>();
    return SizedBox(
      // color: Colors.blue,
      width: context.width,
      height: context.width * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
                onTap: () => _controller.updateIndex(index),
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.all(10.0),
                    width: context.width * 0.15,
                    decoration: BoxDecoration(
                      color: _controller.isSelectedDateIndex(index)
                          ? primaryTextColor
                          : primaryTextColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Text(
                            "Jun",
                            style: TextStyle(
                              fontSize: context.width * 0.05,
                              color: _controller.isSelectedDateIndex(index)
                                  ? secondaryTextColorLight
                                  : secondaryTextColor,
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            "${index + 1 * 10}",
                            style: TextStyle(
                              fontSize: context.width * 0.05,
                              color: _controller.isSelectedDateIndex(index)
                                  ? secondaryTextColorLight
                                  : secondaryTextColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
