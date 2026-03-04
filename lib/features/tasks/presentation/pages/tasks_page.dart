import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miguel_cauich_app/config/router/routes.dart';
import 'package:miguel_cauich_app/features/tasks/presentation/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:miguel_cauich_app/features/tasks/presentation/provider/task_provider.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TaskProvider>().getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: Consumer<TaskProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (provider.failure != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Ocurrió un eror al cargar la información: ${provider.failure?.message}'),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () => provider.getTasks(),
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          }

          if (provider.tasks.isEmpty) {
            return const Center(child: Text('No hay tareas.'));
          }

          return RefreshIndicator.adaptive(
            onRefresh: () => provider.getTasks(),
            child: TasksList(
              tasks: provider.tasks,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(Routes.createUpdateTask),
        child: const Icon(Icons.add),
      ),
    );
  }
}
