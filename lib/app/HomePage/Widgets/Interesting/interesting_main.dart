import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:qube_app/Model/youtube_model.dart';
import 'package:qube_app/app/HomePage/Controllers/main_page_controller.dart';
import 'package:qube_app/misc/colors.dart';

class InterestingPart extends StatelessWidget {
  const InterestingPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<MainPageController>();
    return SizedBox(
      width: context.width,
      height: context.width * 0.9,
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
          const SizedBox(height: 5.0),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: videoDetails.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: context.width * 0.6,
                    height: context.width * 0.4,
                    child: GestureDetector(
                      onTap: () => _controller.openVideo(index),
                      child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.8,
                                child: Image.network(
                                  _controller.videoThumbnail(index),
                                  fit: BoxFit.cover,
                                  height: context.width,
                                ),
                              ),
                              Center(
                                  child: Image.asset(
                                "assets/youtube.png",
                                width: context.width * 0.12,
                              )),
                            ],
                          )),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
