import 'package:dio/dio.dart';
import 'package:miguel_cauich_app/config/api/api_endpoints.dart';

import '../models/task_model.dart';

abstract class TasksRemoteDataSource {
  Future<List<TaskModel>> getTasks();

  // Future<List<String>> fetchTasks() async {
  //   // Simulate a network call to fetch tasks
  //   await Future.delayed(Duration(seconds: 2));
  //   return ['Task 1', 'Task 2', 'Task 3'];
  // }
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
}
