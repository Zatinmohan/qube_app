import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:qube_app/misc/colors.dart';

class InterestingPart extends StatelessWidget {
  const InterestingPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You May Find This Interesting",
            style: TextStyle(
              color: primaryTextColor,
              fontSize: context.width * 0.06,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
              "This is a long text that contains the data related to how to set have emotional intelligence. This data can be dynamic or static. Depends on the API.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: context.width * 0.045,
              )),
        ],
      ),
    );
  }
}
