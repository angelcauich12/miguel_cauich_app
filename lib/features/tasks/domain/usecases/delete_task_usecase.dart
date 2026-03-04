import 'package:dartz/dartz.dart';
import 'package:miguel_cauich_app/core/errors/failures.dart';
import 'package:miguel_cauich_app/core/usecases/usecase.dart';
import 'package:miguel_cauich_app/features/tasks/domain/repositories/tasks_repository.dart';

class DeleteTaskUsecase implements UseCase<bool, int> {
  final TasksRepository repository;

  DeleteTaskUsecase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(int params) async {
    return await repository.deleteTask(params);
  }
}
