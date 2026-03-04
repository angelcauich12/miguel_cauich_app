import 'package:dartz/dartz.dart';
import 'package:miguel_cauich_app/core/errors/failures.dart';
import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';
import 'package:miguel_cauich_app/features/tasks/domain/usecases/create_task_usecase.dart';

abstract class TasksRepository {
  Future<Either<Failure, List<TaskEntity>>> getTasks();
  Future<Either<Failure, TaskEntity>> createTask(CreateUpdateTaskParams params);
  Future<Either<Failure, TaskEntity>> updateTask(CreateUpdateTaskParams params);
  Future<Either<Failure, bool>> deleteTask(int taskId);
  Future<Either<Failure, TaskEntity>> getTaskById(int taskId);
}
