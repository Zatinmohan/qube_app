class FeelingListModel {
  final String name;
  final String image;

  FeelingListModel({required this.name, required this.image});
}

final List<FeelingListModel> feelingList = [
  FeelingListModel(name: "Angry", image: "assets/angry.png"),
  FeelingListModel(name: "Happy", image: "assets/happy.png"),
  FeelingListModel(name: "Sad", image: "assets/sad.png"),
  FeelingListModel(name: "Bored", image: "assets/bored.png"),
  FeelingListModel(name: "Calm", image: "assets/calm.png"),
  FeelingListModel(name: "Loved", image: "assets/loved.png"),
  FeelingListModel(name: "Energetic", image: "assets/energetic.png"),
];
