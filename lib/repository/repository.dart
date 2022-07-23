import 'package:flutter_bloc_8/model/activity_model.dart';

abstract class Repository{
  Future<ActivityResponse> getActivityData();
}