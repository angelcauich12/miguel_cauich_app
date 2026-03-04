import 'package:flutter/material.dart';

import '../../../../config/theme/app_colors.dart';

class BuildStatusBadge extends StatelessWidget {
  final bool isCompleted;
  const BuildStatusBadge({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
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
}
