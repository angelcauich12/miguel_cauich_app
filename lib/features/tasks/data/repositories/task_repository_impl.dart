import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:miguel_cauich_app/core/errors/exceptions.dart';
import 'package:miguel_cauich_app/core/errors/failures.dart';
import 'package:miguel_cauich_app/features/tasks/data/datasources/tasks_remote_data_source.dart';
import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';
import 'package:miguel_cauich_app/features/tasks/domain/repositories/tasks_repository.dart';

class TaskRepositoryImpl implements TasksRepository {
  final TasksRemoteDataSource tasksRemoteDataSource;

  TaskRepositoryImpl({required this.tasksRemoteDataSource});

  @override
  Future<void> addTask(String title) {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask(String id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Task>> getTaskById(String id) {
    // TODO: implement getTaskById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks() async {
    try {
      final response = await tasksRemoteDataSource.getTasks();
      return Right(response);
    } on DioException catch (e) {
      final networkException = NetworkException.fromDioError(e);
      return Left(NetworkFailure(message: networkException.message));
    } on ServerException {
      return const Left(ServerFailure(message: "Server error occurred"));
    } catch (e) {
      print(e);
      return  Left(ServerFailure(message: "Unexpected error :$e"));
    }
  }

  @override
  Future<void> updateTask(String id, String title) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
