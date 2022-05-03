import 'package:qube_app/Model/feeling_model.dart';

// This class mainly be used in applications where multiple APIs been used
// Or if api is been used if multiple actions such as Read, delete, add, update functionality is been used with the same API
// Repository Pattern

abstract class Repository {
  // To Fetch the data
  Future<FeelingHabitModel> getData();
}
