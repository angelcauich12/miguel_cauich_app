import 'package:dio/dio.dart';
import 'package:miguel_cauich_app/config/api/api_endpoints.dart';

import '../models/task_model.dart';

abstract class TasksRemoteDataSource {
  Future<List<TaskModel>> getTasks();
  Future<TaskModel> createTask(TaskModel taskModel);
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

    print(taskModel.toMap());

    return TaskModel.fromMap(response.data['task']);
  }
}
