import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miguel_cauich_app/features/tasks/presentation/provider/task_provider.dart';
import 'package:provider/provider.dart';

import '../../../../config/router/routes.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_spacing.dart';
import '../../../../config/theme/app_typography.dart';
import '../../domain/entities/task_entity.dart';
import '../widgets/build_status_badge.dart';

class TaskDetailPage extends StatefulWidget {
  final int taskId;
  const TaskDetailPage({super.key, required this.taskId});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TaskProvider>().getTaskDetail(widget.taskId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de Tarea')),
      body: Consumer<TaskProvider>(
        builder: (context, prov, _) {
          if (prov.isLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (prov.selectedTask == null) {
            return const Center(child: Text('No se encontró la tarea'));
          }

          final task = prov.selectedTask!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(task),
                const Divider(height: 32),
                _buildInfoSection('Descripción', task.description),
                _buildInfoSection('Comentarios', task.comments),
                _buildInfoSection('Etiquetas', task.tags),
                const SizedBox(height: 20),
                _buildDateTile(task.date),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Consumer<TaskProvider>(
        builder: (context, prov, _) {
          if (prov.selectedTask == null || prov.isLoading) {
            return const SizedBox.shrink();
          }

          return FloatingActionButton.extended(
            onPressed: () => context.push(Routes.createUpdateTask, extra: prov.selectedTask),
            label: const Text('Editar Tarea'),
            icon: const Icon(Icons.edit),
          );
        },
      ),
    );
  }
}

Widget _buildHeader(TaskEntity task) {
  return Row(
    children: [
      Expanded(
        child: Text(task.title, style: AppTypography.heading2),
      ),
      BuildStatusBadge(isCompleted: task.isCompleted),
    ],
  );
}

Widget _buildInfoSection(String label, String? value) {
  if (value == null || value.isEmpty) return const SizedBox.shrink();
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.gray600)),
        const SizedBox(height: 4),
        Text(value, style: AppTypography.bodyLarge),
      ],
    ),
  );
}

Widget _buildDateTile(DateTime? date) {
  if (date == null) return const SizedBox.shrink();
  return Card(
    child: ListTile(
      leading: const Icon(Icons.calendar_today),
      title: const Text('Fecha de entrega'),
      subtitle: Text("${date.day}/${date.month}/${date.year}"),
    ),
  );
}
