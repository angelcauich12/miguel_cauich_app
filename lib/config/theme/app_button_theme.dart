import 'package:flutter/material.dart';
import 'package:miguel_cauich_app/config/theme/app_colors.dart';
import 'package:miguel_cauich_app/config/theme/app_spacing.dart';
import 'package:miguel_cauich_app/config/theme/app_typography.dart';


class AppButtonTheme {
  // ElevatedButton styles
  static ElevatedButtonThemeData elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.surface,
        disabledBackgroundColor: AppColors.gray200,
        disabledForegroundColor: AppColors.gray500,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusLarge,
        ),
        textStyle: AppTypography.buttonMedium.copyWith(
          color: AppColors.surface,
        ),
      ),
    );
  }

  // OutlinedButton styles
  static OutlinedButtonThemeData outlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(
          color: AppColors.primary,
          width: 1.5,
        ),
        disabledForegroundColor: AppColors.gray400,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusLarge,
        ),
        textStyle: AppTypography.buttonMedium.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }

  // TextButton styles
  static TextButtonThemeData textButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        disabledForegroundColor: AppColors.gray400,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusLarge,
        ),
        textStyle: AppTypography.buttonMedium.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }

  // Custom filled button
  static ElevatedButton filledButton({
    required String label,
    required VoidCallback onPressed,
    bool isLoading = false,
    Widget? icon,
  }) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.surface,
                ),
              ),
            )
          : label.isNotEmpty
              ? Text(label)
              : icon,
    );
  }

  // Custom outlined button
  static OutlinedButton outlinedButton({
    required String label,
    required VoidCallback onPressed,
    Widget? icon,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      child: label.isNotEmpty ? Text(label) : icon,
    );
  }

  // Custom text button
  static TextButton textButton({
    required String label,
    required VoidCallback onPressed,
    TextStyle? textStyle,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: textStyle ?? AppTypography.buttonMedium,
      ),
    );
  }
}
