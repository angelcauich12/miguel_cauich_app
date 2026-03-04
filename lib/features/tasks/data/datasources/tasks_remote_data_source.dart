import 'package:dio/dio.dart';
import 'package:miguel_cauich_app/config/api/api_endpoints.dart';

import '../models/task_model.dart';

abstract class TasksRemoteDataSource {
  Future<List<TaskModel>> getTasks();
  Future<TaskModel> createTask(TaskModel taskModel);
  Future<TaskModel> updateTask(TaskModel taskModel);
  Future<bool> deleteTask(int taskId);
  Future<TaskModel> getTaskById(int taskId);
}

class TasksRemoteDataSourceImpl extends TasksRemoteDataSource {
  final Dio dio;

  TasksRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<TaskModel>> getTasks() async {
    final response = await dio.get(ApiEndpoints.tasks);

    if (response.data is List) {
      return (response.data as List)
          .map((task) => TaskModel.fromMap(task))
          .toList();
    }

    return [];
  }

  @override
  Future<TaskModel> createTask(TaskModel taskModel) async {
    final response = await dio.post(
      ApiEndpoints.tasks,
      data: taskModel.toMap(),
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    return TaskModel.fromMap(response.data['task']);
  }

  @override
  Future<TaskModel> updateTask(TaskModel taskModel) async {
    final response = await dio.put(
      '${ApiEndpoints.tasks}/${taskModel.id}',
      data: taskModel.toMap(),
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    return TaskModel.fromMap(response.data['task']);
  }

  @override
  Future<bool> deleteTask(int taskId) async {
    final response = await dio.delete(
      '${ApiEndpoints.tasks}/$taskId',
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data['detail'] != null;
    }

    return false;
  }

  @override
  Future<TaskModel> getTaskById(int taskId) async {
    final response = await dio.get(
      '${ApiEndpoints.tasks}/$taskId',
    );

    return TaskModel.fromMap(response.data[0]);
  }
}
