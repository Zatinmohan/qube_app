class FeelingHabitModel {
  List<FeelingList>? feelingList;
  FeelingPercentage? feelingPercentage;

  FeelingHabitModel({this.feelingList, this.feelingPercentage});

  factory FeelingHabitModel.fromJson(Map<dynamic, dynamic> json) =>
      FeelingHabitModel(
          feelingList: List<FeelingList>.from(
              json["feeling_list"].map((x) => FeelingList.fromJson(x))),
          feelingPercentage:
              FeelingPercentage.fromJson(json["feeling_percentage"]));
}

class FeelingList {
  final int feelingId;
  final String feelingName;
  final String submitTime;
  final int userFeelingId;

  FeelingList(
      {required this.feelingId,
      required this.feelingName,
      required this.submitTime,
      required this.userFeelingId});

  factory FeelingList.fromJson(Map<dynamic, dynamic> json) => FeelingList(
      feelingId: json["feeling_id"],
      feelingName: json["feeling_name"],
      submitTime: json["submit_time"],
      userFeelingId: json["user_feeling_id"]);
}

class FeelingPercentage {
  int angry;
  int bored;
  int calm;
  int energetic;
  int happy;
  int sad;
  int loved;

  FeelingPercentage({
    required this.angry,
    required this.bored,
    required this.calm,
    required this.energetic,
    required this.happy,
    required this.sad,
    required this.loved,
  });

  factory FeelingPercentage.fromJson(Map<dynamic, dynamic> json) =>
      FeelingPercentage(
        angry: json["Angry"] ?? 0,
        bored: json["Bored"] ?? 0,
        calm: json["Calm"] ?? 0,
        energetic: json["Energetic"] ?? 0,
        happy: json["Happy"] ?? 0,
        sad: json["Sad"] ?? 0,
        loved: json["loved"] ?? 0,
      );
}
