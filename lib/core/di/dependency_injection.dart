import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:miguel_cauich_app/features/tasks/data/datasources/tasks_remote_data_source.dart';
import 'package:miguel_cauich_app/features/tasks/data/repositories/task_repository_impl.dart';
import 'package:miguel_cauich_app/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:miguel_cauich_app/features/tasks/domain/usecases/create_task_usecase.dart';
import 'package:miguel_cauich_app/features/tasks/domain/usecases/get_tasks_usesace.dart';
import 'package:miguel_cauich_app/features/tasks/presentation/provider/task_provider.dart';

import '../../config/api/api_client.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  ApiClient.setup();
  sl.registerLazySingleton<Dio>(() => ApiClient.instance);

  sl.registerLazySingleton<TasksRemoteDataSource>(
      () => TasksRemoteDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<TasksRepository>(
      () => TaskRepositoryImpl(tasksRemoteDataSource: sl()));

  sl.registerLazySingleton(() => GetTasksUsesace(repository: sl()));
  sl.registerLazySingleton(() => CreateTaskUsecase(repository: sl()));

  sl.registerFactory(() => TaskProvider(
    getTasksUsesace: sl(),
    createTaskUsecase: sl()
    ));
}
