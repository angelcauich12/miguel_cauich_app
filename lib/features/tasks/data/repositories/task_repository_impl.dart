import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:miguel_cauich_app/core/errors/exceptions.dart';
import 'package:miguel_cauich_app/core/errors/failures.dart';
import 'package:miguel_cauich_app/features/tasks/data/datasources/tasks_remote_data_source.dart';
import 'package:miguel_cauich_app/features/tasks/data/models/task_model.dart';
import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';
import 'package:miguel_cauich_app/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:miguel_cauich_app/features/tasks/domain/usecases/create_task_usecase.dart';

class TaskRepositoryImpl implements TasksRepository {
  final TasksRemoteDataSource tasksRemoteDataSource;

  TaskRepositoryImpl({required this.tasksRemoteDataSource});

  @override
  Future<Either<Failure, TaskEntity>> createTask(
      CreateUpdateTaskParams params) async {
    try {
      final response =
          await tasksRemoteDataSource.createTask(TaskModel.fromEntity(params));
      return Right(response);
    } on DioException catch (e) {
      final networkException = NetworkException.fromDioError(e);
      return Left(NetworkFailure(message: networkException.message));
    } on ServerException {
      return const Left(ServerFailure(message: "Server error occurred"));
    } catch (e) {
      return Left(ServerFailure(message: "Unexpected error :$e"));
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> updateTask(
      CreateUpdateTaskParams params) async {
    try {
      final response =
          await tasksRemoteDataSource.updateTask(TaskModel.fromEntity(params));
      return Right(response);
    } on DioException catch (e) {
      final networkException = NetworkException.fromDioError(e);
      return Left(NetworkFailure(message: networkException.message));
    } on ServerException {
      return const Left(ServerFailure(message: "Server error occurred"));
    } catch (e) {
      return Left(ServerFailure(message: "Unexpected error :$e"));
    }
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
      return Left(ServerFailure(message: "Unexpected error :$e"));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTask(int taskId) async {
    try {
      final response = await tasksRemoteDataSource.deleteTask(taskId);
      return Right(response);
    } on DioException catch (e) {
      final networkException = NetworkException.fromDioError(e);
      return Left(NetworkFailure(message: networkException.message));
    } on ServerException {
      return const Left(ServerFailure(message: "Server error occurred"));
    } catch (e) {
      return Left(ServerFailure(message: "Unexpected error :$e"));
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> getTaskById(taskId) async {
    try {
      final response = await tasksRemoteDataSource.getTaskById(taskId);
      return Right(response);
    } on DioException catch (e) {
      final networkException = NetworkException.fromDioError(e);
      return Left(NetworkFailure(message: networkException.message));
    } on ServerException {
      return const Left(ServerFailure(message: "Server error occurred"));
    } catch (e) {
      return Left(ServerFailure(message: "Unexpected error :$e"));
    }
  }
}
