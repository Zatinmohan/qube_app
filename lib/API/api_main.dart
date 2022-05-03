import 'package:get/get.dart';
import 'package:qube_app/Model/feeling_model.dart';
import 'package:qube_app/Repository/repo_main.dart';

class FeelingAPI extends GetConnect implements Repository {
  final String APIURL =
      "https://feelingapp-cbfe0-default-rtdb.firebaseio.com/Data.json";

  @override
  Future<FeelingHabitModel> getData() async {
    final response = await get(APIURL);

    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      FeelingHabitModel object = FeelingHabitModel.fromJson(response.body);
      return object;
    }
  }
}
