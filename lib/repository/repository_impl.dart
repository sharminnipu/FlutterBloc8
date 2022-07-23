import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_8/domain/api_client.dart';
import 'package:flutter_bloc_8/model/activity_model.dart';
import 'package:flutter_bloc_8/repository/repository.dart';

class RepositoryImpl extends Repository{

  @override
  Future<ActivityResponse> getActivityData() async {
    final response = await ApiClient().getDataWithoutToken('activity');
      if (response.statusCode == 200) {
      final activity=ActivityResponse.fromJson(response.data);
      return activity;
      } else {
        throw Exception('Failed to load');
      }
  }


  }

