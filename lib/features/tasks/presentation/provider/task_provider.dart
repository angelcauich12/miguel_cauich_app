import 'package:flutter/material.dart';
import 'package:miguel_cauich_app/core/errors/failures.dart';
import 'package:miguel_cauich_app/core/usecases/usecase.dart';
import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';
import 'package:miguel_cauich_app/features/tasks/domain/usecases/get_tasks_usesace.dart';

class TaskProvider extends ChangeNotifier {
  final GetTasksUsesace getTasksUsesace;
  TaskProvider({required this.getTasksUsesace});

  Failure? failure;
  bool isLoading = false;
  String success = '';

  List<TaskEntity> tasks = [];

  Future<void> getTasks() async {
    try {
      isLoading = true;
      failure = null;
      notifyListeners();
      final result = await getTasksUsesace(NoParams());
      result.fold((fail) {
        failure = fail;

      }, (tasksList) => tasks = tasksList);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
