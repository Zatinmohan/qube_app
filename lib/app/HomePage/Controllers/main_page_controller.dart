import 'package:get/get.dart';
import 'package:qube_app/API/api_main.dart';
import 'package:qube_app/Model/feeling_model.dart';
import 'package:qube_app/Model/youtube_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

// Used with SateMixin functionality that will handle the API calls without using FutureBuilder

class MainPageController extends GetxController
    with StateMixin<FeelingHabitModel> {
  RxInt dateIndex = 0.obs;
  late Rx<FeelingHabitModel> data = FeelingHabitModel().obs;
  RxString finalDate = "10 Jun, 2022".obs;
  RxList<YoutubeModel> videoData = videoDetails.obs;

  @override
  void onInit() {
    _fetchData();
    super.onInit();
  }

  // This funciton is used to fetch data from API
  void _fetchData() {
    FeelingAPI().getData().then((value) {
      change(value, status: RxStatus.success());
      data.value = value;
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  //Fetching the image from the youtube
  String videoThumbnail(int index) => videoData[index].image!;

  void openVideo(int index) async {
    if (await canLaunchUrlString(videoDetails[index].name!)) {
      await launchUrlString(videoDetails[index].name!);
    } else {
      Get.snackbar("Error!", "Can't open Video, Try again later",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // This is for checking if the right card is been selected.
  bool isSelectedDateIndex(int index) =>
      index == dateIndex.value ? true : false;

  // This is for updating the index when user tap on the card
  // This will also update the date on the Container shown on the page.
  void updateIndex(int index) {
    dateIndex.value = index;
    _updateDate(index);
  }

  void _updateDate(int index) {
    finalDate.value =
        (index + 1 * 10).toString() + finalDate.value.substring(2);
  }

  // This will return the value according to the index on which value should be displayed.
  String getPercentageValue(int index) {
    switch (index) {
      case 0:
        return anger;
      case 1:
        return happy;
      case 2:
        return sad;
      case 3:
        return bored;
      case 4:
        return calm;
      case 5:
        return loved;
      case 6:
        return energetic;
      default:
        return happy;
    }
  }

  // These will get the values of all the feelings that are fetched from the API
  // and return them in the form of String.
  String get anger => (data.value.feelingPercentage!.angry * 10).toString();
  String get happy => (data.value.feelingPercentage!.happy * 10).toString();
  String get sad => (data.value.feelingPercentage!.sad * 10).toString();
  String get bored => (data.value.feelingPercentage!.bored * 10).toString();
  String get calm => (data.value.feelingPercentage!.calm * 10).toString();
  String get energetic =>
      (data.value.feelingPercentage!.energetic * 10).toString();
  String get loved => (data.value.feelingPercentage!.loved * 10).toString();

  // Return the length of data fetched from the API
  int get totalData => data.value.feelingList!.length;

  // Fetch the time from API and decides the range of time as well.
  String getTime(int index) {
    int t =
        int.parse(data.value.feelingList![index].submitTime.substring(11, 13));

    if (t <= 9) {
      return "6 AM - 9 AM";
    } else if (t > 9 && t <= 12) {
      return "9 AM - 12 PM";
    } else if (t > 12 && t <= 15) {
      return "12 PM - 3 PM";
    } else if (t > 15 && t <= 18) {
      return "3 PM - 6 PM";
    } else if (t > 18 && t <= 21) {
      return "6 PM - 9 PM";
    }

    return "9 PM - 12 AM";
  }

  // Show message on the basis of value fetched from API
  // Shows the raw msg into a well formatted msg.
  String getDataWithTime(int index) {
    String feeling = data.value.feelingList![index].feelingName;

    switch (feeling) {
      case "Calm":
        return "🍃 Calm";

      case "Happy":
        return "🤗 Happy";

      case "Sad":
        return "😔 Sad";

      case "Energetic":
        return "⚡ Energetic";

      case "Bored":
        return "🥱 Bored";

      case "Loved":
        return "😍 Loved";

      case "Angry":
        return "😡 Angry";

      default:
        return "🤗 Happy";
    }
  }
}
