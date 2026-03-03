import 'dart:convert';

import 'package:miguel_cauich_app/features/tasks/data/models/task_model.dart';

class TaksApiResponse {
  final String message;
  final TaskModel task;

  TaksApiResponse({
    required this.message,
    required this.task,
  });

  factory TaksApiResponse.fromJson(String str) => TaksApiResponse.fromMap(json.decode(str));


  factory TaksApiResponse.fromMap(Map<String, dynamic> json) => TaksApiResponse(
        message: json["detail"],
        task: TaskModel.fromMap(json["task"]),
      );
}
