import 'package:flutter/material.dart';
import 'package:miguel_cauich_app/config/theme/app_colors.dart';
import 'package:miguel_cauich_app/config/theme/app_spacing.dart';
import 'package:miguel_cauich_app/config/theme/app_typography.dart';
import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';

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
                _buildStatusBadge(task.isCompleted),
              ],
            ),
            onTap: () {
            },
          ),
        );
      },
    );
  }
}

Widget _buildStatusBadge(bool isCompleted) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: isCompleted
          ? AppColors.success.withOpacity(0.1)
          : AppColors.gray600.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: isCompleted ? Colors.green : AppColors.gray500,
        width: 1,
      ),
    ),
    child: Text(
      isCompleted ? 'COMPLETADA' : 'PENDIENTE',
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: isCompleted ? AppColors.successDark : AppColors.gray800,
      ),
    ),
  );
}
