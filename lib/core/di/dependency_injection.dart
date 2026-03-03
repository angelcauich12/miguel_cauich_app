import 'package:get_it/get_it.dart';
import 'package:miguel_cauich_app/features/tasks/presentation/provider/task_provider.dart';

import '../../config/api/api_client.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  ApiClient.setup();

  sl.registerFactory(() => TaskProvider());
}
