import 'dart:convert';

import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';
import 'package:miguel_cauich_app/features/tasks/domain/usecases/create_task_usecase.dart';

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
        isCompleted: json["is_completed"].toString() == "1",
        date:
            json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        comments: json["comments"],
        description: json["description"],
        tags: json["tags"],
      );

  factory TaskModel.fromEntity(CreateTaskParams params) {
    return TaskModel(
      id: -1,
      title: params.title,
      isCompleted: params.isCompleted,
      description: params.description,
      comments: params.comments,
      tags: params.tags,
      date: params.date,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {
      "id": id,
      "title": title,
      "is_completed": isCompleted ? 1 : 0,
      "comments": comments,
      "description": description,
      "tags": tags
    };

    if (date != null) {
      map["due_date"] = "${date!.year.toString().padLeft(4, '0')}-"
          "${date!.month.toString().padLeft(2, '0')}-"
          "${date!.day.toString().padLeft(2, '0')}";
    }

    if (id != -1 && id != 0) {
      map["id"] = id;
    }

    return map;
  }
}
