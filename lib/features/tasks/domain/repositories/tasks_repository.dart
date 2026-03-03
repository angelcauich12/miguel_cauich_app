import 'package:dartz/dartz.dart';
import 'package:miguel_cauich_app/core/errors/failures.dart';
import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';
import 'package:miguel_cauich_app/features/tasks/domain/usecases/create_task_usecase.dart';

abstract class TasksRepository {
  Future<Either<Failure, TaskEntity>> createTask(CreateTaskParams params);
  Future<void> deleteTask(String id);
  Future<void> updateTask(String id, String title);
  Future<Either<Failure, List<TaskEntity>>> getTasks();
  Future<Either<Failure, Task>> getTaskById(String id);
}
