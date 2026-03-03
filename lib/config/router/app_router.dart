import 'package:go_router/go_router.dart';
import 'package:miguel_cauich_app/config/router/routes.dart';
import 'package:miguel_cauich_app/features/tasks/presentation/pages/tasks_page.dart';

class AppRouter {
  GoRouter get router => GoRouter(
        initialLocation: Routes.splash,
        routes: [
          GoRoute(
              path: Routes.splash,
              name: 'splash',
              builder: (context, state) => const TasksPage()),
        ],
      );
}
