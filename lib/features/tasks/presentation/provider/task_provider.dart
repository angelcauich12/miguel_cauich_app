import 'package:flutter/material.dart';
import 'package:miguel_cauich_app/core/errors/failures.dart';
import 'package:miguel_cauich_app/core/usecases/usecase.dart';
import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';
import 'package:miguel_cauich_app/features/tasks/domain/usecases/create_task_usecase.dart';
import 'package:miguel_cauich_app/features/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:miguel_cauich_app/features/tasks/domain/usecases/get_task_detail_usecase.dart';
import 'package:miguel_cauich_app/features/tasks/domain/usecases/get_tasks_usesace.dart';
import 'package:miguel_cauich_app/features/tasks/domain/usecases/update_task_usecase.dart';

class TaskProvider extends ChangeNotifier {
  final GetTasksUsesace getTasksUsesace;
  final CreateTaskUsecase createTaskUsecase;
  final UpdateTaskUsecase updateTaskUsecase;
  final DeleteTaskUsecase deleteTaskUsecase;
  final GetTaskDetailUsecase getTaskDetailUsecase;

  TaskProvider(
      {required this.getTasksUsesace,
      required this.createTaskUsecase,
      required this.updateTaskUsecase,
      required this.deleteTaskUsecase,
      required this.getTaskDetailUsecase});

  Failure? failure;
  bool isLoading = false;
  bool isLoadingTasks = false;
  String? successTask;
  Failure? taskFailure;
  TaskEntity? selectedTask;

  List<TaskEntity> tasks = [];

  Future<void> getTasks() async {
    try {
      isLoadingTasks = true;
      failure = null;
      notifyListeners();
      final result = await getTasksUsesace(NoParams());
      result.fold((fail) {
        failure = fail;
      }, (tasksList) => tasks = tasksList);
    } finally {
      isLoadingTasks = false;
      notifyListeners();
    }
  }

  Future<bool> createupdateTask(
      int? taskId, CreateUpdateTaskParams params) async {
    if (taskId == null) {
      return await createTask(params);
    }
    return await updateTask(params);
  }

  Future<bool> createTask(CreateUpdateTaskParams params) async {
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

  Future<bool> updateTask(CreateUpdateTaskParams params) async {
    try {
      isLoading = true;
      taskFailure = null;
      successTask = null;
      notifyListeners();
      final result = await updateTaskUsecase(params);
      return result.fold((fail) {
        taskFailure = fail;
        return false;
      }, (updatedTask) {
        successTask = 'Tarea actualizada satisfactoriamente';
        final index = tasks.indexWhere((task) => task.id == updatedTask.id);
        tasks[index] = updatedTask;

        if (selectedTask?.id == updatedTask.id) {
          selectedTask = updatedTask;
        }

        return true;
      });
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> deleteTask(int taskId) async {
    try {
      isLoading = true;
      failure = null;
      notifyListeners();
      final result = await deleteTaskUsecase(taskId);
      return result.fold((fail) {
        failure = fail;
        return false;
      }, (taskDeleted) {
        tasks.removeWhere((task) => task.id == taskId);
        successTask = 'Tarea eliminada satisfactoriamente';
        return true;
      });
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getTaskDetail(int id) async {
    try {
      isLoading = true;
      selectedTask = null;
      notifyListeners();

      final result = await getTaskDetailUsecase(id);
      result.fold(
        (fail) => taskFailure = fail,
        (task) => selectedTask = task,
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
