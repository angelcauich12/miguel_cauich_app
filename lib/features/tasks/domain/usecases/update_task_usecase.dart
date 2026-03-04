import 'package:dartz/dartz.dart';
import 'package:miguel_cauich_app/core/errors/failures.dart';
import 'package:miguel_cauich_app/core/usecases/usecase.dart';
import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';
import 'package:miguel_cauich_app/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:miguel_cauich_app/features/tasks/domain/usecases/create_task_usecase.dart';

class UpdateTaskUsecase implements UseCase<TaskEntity, CreateUpdateTaskParams> {
  final TasksRepository repository;

  UpdateTaskUsecase({required this.repository});

  @override
  Future<Either<Failure, TaskEntity>> call(CreateUpdateTaskParams params) async {
    return await repository.updateTask(params);
  }
}


