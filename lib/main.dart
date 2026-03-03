import 'package:flutter/material.dart';
import 'package:miguel_cauich_app/config/router/app_router.dart';
import 'package:miguel_cauich_app/config/theme/app_theme.dart';
import 'package:miguel_cauich_app/features/tasks/presentation/provider/task_provider.dart';
import 'package:provider/provider.dart';

import 'core/di/dependency_injection.dart';
import 'core/services/snackbar_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<TaskProvider>()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final appRouter = AppRouter();
      return MaterialApp.router(
        routerConfig: appRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Miguel Cauich App',
        scaffoldMessengerKey: SnackbarService.scaffoldMessengerKey,
        theme: AppTheme.light,
      );
    });
  }
}
