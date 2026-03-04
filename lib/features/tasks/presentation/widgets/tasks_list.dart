import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miguel_cauich_app/config/router/routes.dart';
import 'package:miguel_cauich_app/config/theme/app_colors.dart';
import 'package:miguel_cauich_app/config/theme/app_spacing.dart';
import 'package:miguel_cauich_app/config/theme/app_typography.dart';
import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';
import 'package:miguel_cauich_app/features/tasks/presentation/provider/task_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/snackbar_service.dart';
import 'build_status_badge.dart';

class TasksList extends StatelessWidget {
  final List<TaskEntity> tasks;

  const TasksList({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: tasks.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Card(
          child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md, vertical: AppSpacing.sm),
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      task.title,
                      style: AppTypography.buttonLarge,
                    ),
                  ),
                  BuildStatusBadge(isCompleted: task.isCompleted),
                ],
              ),
              onTap: () => context.pushNamed(
                    RouteNames.taskDetail,
                    pathParameters: {'id': task.id.toString()},
                  ),
              trailing: PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                onSelected: (value) {
                  if (value == 'DELETE') _confirmDelete(context, task);
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'DELETE',
                    child: ListTile(
                      leading: Icon(Icons.delete, size: 20),
                      title: Text(
                        'Eliminar',
                      ),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }

  void _confirmDelete(BuildContext context, TaskEntity task) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Consumer<TaskProvider>(
          builder: (context, prov, _) => AlertDialog(
                title: const Text('¿Eliminar tarea?'),
                content: Text(
                    'Esta acción eliminará "${task.title}" permanentemente.'),
                actions: [
                  TextButton(
                    onPressed:
                        prov.isLoading ? null : () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: prov.isLoading
                        ? null
                        : () async {
                            final readProv = context.read<TaskProvider>();
                            final result = await readProv.deleteTask(task.id);
                            if (!context.mounted) return;

                            if (result) {
                              final message = readProv.successTask;
                              SnackbarService.showSuccess(
                                  message ?? 'Tarea eliminada');
                            }

                            Navigator.pop(context);
                          },
                    child: Text(prov.isLoading ? 'Eliminando...' : 'Eliminar',
                        style: const TextStyle(color: Colors.white)),
                  ),
                ],
              )),
    );
  }
}
