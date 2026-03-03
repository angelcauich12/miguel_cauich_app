import 'dart:convert';

import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel(
      {required super.id,
      required super.title,
      required super.isCompleted,
      super.comments,
      super.tags,
      super.date,
      super.description});

  factory TaskModel.fromJson(String str) => TaskModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TaskModel.fromMap(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        isCompleted: json["is_completed"] ==1,
        date:
            json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "is_completed": isCompleted,
        "due_date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
      };
}
