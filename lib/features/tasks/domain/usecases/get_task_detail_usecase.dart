import 'package:dartz/dartz.dart';
import 'package:miguel_cauich_app/core/errors/failures.dart';
import 'package:miguel_cauich_app/core/usecases/usecase.dart';
import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';
import 'package:miguel_cauich_app/features/tasks/domain/repositories/tasks_repository.dart';

class GetTaskDetailUsecase implements UseCase<TaskEntity, int> {
  final TasksRepository repository;

  GetTaskDetailUsecase({required this.repository});

  @override
  Future<Either<Failure, TaskEntity>> call(int params) async {
    return await repository.getTaskById(params);
  }
}
