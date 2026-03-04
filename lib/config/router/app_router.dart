import 'package:go_router/go_router.dart';
import 'package:miguel_cauich_app/config/router/routes.dart';
import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';
import 'package:miguel_cauich_app/features/tasks/presentation/pages/create_update_task_page.dart';
import 'package:miguel_cauich_app/features/tasks/presentation/pages/task_detail_page.dart';
import 'package:miguel_cauich_app/features/tasks/presentation/pages/tasks_page.dart';

class AppRouter {
  GoRouter get router => GoRouter(
        initialLocation: Routes.splash,
        routes: [
          GoRoute(
              path: Routes.splash,
              name: 'splash',
              builder: (context, state) => const TasksPage()),
          GoRoute(
              path: Routes.createUpdateTask,
              name: 'create_update_task',
              builder: (context, state) {
                final task = state.extra as TaskEntity?;
                return CreateUpdateTaskPage(
                  task: task,
                );
              }),
          GoRoute(
              path: Routes.taskDetail,
              name: RouteNames.taskDetail,
              builder: (context, state) {
                final taskId = int.parse(state.pathParameters['id']!);
                return TaskDetailPage(
                  taskId: taskId,
                );
              }),
        ],
      );
}
