import 'package:dartz/dartz.dart';
import 'package:miguel_cauich_app/core/errors/failures.dart';
import 'package:miguel_cauich_app/core/usecases/usecase.dart';
import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';
import 'package:miguel_cauich_app/features/tasks/domain/repositories/tasks_repository.dart';

class CreateTaskUsecase implements UseCase<TaskEntity, CreateTaskParams> {
  final TasksRepository repository;

  CreateTaskUsecase({required this.repository});

  @override
  Future<Either<Failure, TaskEntity>> call(CreateTaskParams params) async {
    return await repository.createTask(params);
  }
}

class CreateTaskParams {
  final String title;
  final bool isCompleted;
  final String? comments;
  final String? description;
  final String? tags;
  final DateTime? date;

  CreateTaskParams(
      {
      required this.title,
      required this.isCompleted,
      this.description,
      this.tags,
      this.comments,
      this.date});
}
