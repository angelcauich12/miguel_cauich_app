import 'package:flutter/material.dart';
import 'package:miguel_cauich_app/core/errors/failures.dart';
import 'package:miguel_cauich_app/core/usecases/usecase.dart';
import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';
import 'package:miguel_cauich_app/features/tasks/domain/usecases/create_task_usecase.dart';
import 'package:miguel_cauich_app/features/tasks/domain/usecases/get_tasks_usesace.dart';

class TaskProvider extends ChangeNotifier {
  final GetTasksUsesace getTasksUsesace;
  final CreateTaskUsecase createTaskUsecase;
  TaskProvider(
      {required this.getTasksUsesace, required this.createTaskUsecase});

  Failure? failure;
  bool isLoading = false;
  String? successTask;
  Failure? taskFailure;

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

  Future<bool> createTask(CreateTaskParams params) async {
    try {
      isLoading = true;
      taskFailure = null;
      successTask = null;
      notifyListeners();
      final result = await createTaskUsecase(params);
      return result.fold((fail) {
        taskFailure = fail;
        return false;
      }, (createdTask) {
        successTask = 'Tarea creada satisfactoriamente';
        tasks.add(createdTask);
        return true;
      });
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateTask() async {
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
