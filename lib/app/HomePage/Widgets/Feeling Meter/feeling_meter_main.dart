import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qube_app/app/HomePage/Widgets/Feeling%20Meter/feeling_place_holders.dart';
import 'package:qube_app/misc/colors.dart';

class FeelingMeter extends StatelessWidget {
  const FeelingMeter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TitleTextWidget(),
          SizedBox(height: 10.0),
          FeelingCards(),
        ],
      ),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Your feelings from last 30 days",
      style: TextStyle(
        color: primaryTextColor,
        fontSize: context.width * 0.05,
      ),
    );
  }
}
