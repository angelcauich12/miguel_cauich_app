import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';


class AppInputDecoration {
  static InputDecoration _baseDecoration({
    required String label,
    String? hint,
    Widget? prefixIcon,
    Widget? suffixIcon,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    Color? fillColor,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: fillColor ?? AppColors.surface,
      labelStyle: labelStyle ?? AppTypography.labelMedium,
      hintStyle: hintStyle ??
          AppTypography.bodyMedium.copyWith(
            color: AppColors.inputHint,
          ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      enabledBorder:
          enabledBorder ??
          OutlineInputBorder(
            borderRadius: AppSpacing.borderRadiusLarge,
            borderSide: const BorderSide(
              color: AppColors.inputEnabledBorder,
              width: 1.5,
            ),
          ),
      focusedBorder:
          focusedBorder ??
          OutlineInputBorder(
            borderRadius: AppSpacing.borderRadiusLarge,
            borderSide: const BorderSide(
              color: AppColors.inputFocusedBorder,
              width: 2.0,
            ),
          ),
      errorBorder:
          errorBorder ??
          OutlineInputBorder(
            borderRadius: AppSpacing.borderRadiusLarge,
            borderSide: const BorderSide(
              color: AppColors.inputErrorBorder,
              width: 1.5,
            ),
          ),
      focusedErrorBorder:
          OutlineInputBorder(
            borderRadius: AppSpacing.borderRadiusLarge,
            borderSide: const BorderSide(
              color: AppColors.inputErrorBorder,
              width: 2.0,
            ),
          ),
      disabledBorder:
          OutlineInputBorder(
            borderRadius: AppSpacing.borderRadiusLarge,
            borderSide: const BorderSide(
              color: AppColors.inputEnabledBorder,
              width: 1.5,
            ),
          ),
    );
  }

  // Default text field decoration
  static InputDecoration textField({
    required String label,
    String? hint,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return _baseDecoration(
      label: label,
      hint: hint,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  // Email field decoration
  static InputDecoration emailField({String? hint}) {
    return _baseDecoration(
      label: 'Email',
      hint: hint ?? 'example@email.com',
      prefixIcon: const Icon(CupertinoIcons.mail),
    );
  }

  // Password field decoration
  static InputDecoration passwordField({
    String? label,
    String? hint,
    Widget? suffixIcon,
  }) {
    return _baseDecoration(
      label: label ?? 'Contraseña',
      hint: hint ?? '••••••••',
      prefixIcon: const Icon(CupertinoIcons.lock),
      suffixIcon: suffixIcon ?? const Icon(Icons.visibility_off_outlined),
    );
  }

  // Search field decoration
  static InputDecoration searchField({String? hint}) {
    return _baseDecoration(
      label: 'Buscar',
      hint: hint ?? 'Escribe aquí...',
      prefixIcon: const Icon(Icons.search),
      fillColor: AppColors.gray100,
    );
  }

  // Error decoration
  static InputDecoration withError({
    required String label,
    String? hint,
    Widget? prefixIcon,
    String? errorText,
  }) {
    return _baseDecoration(
      label: label,
      hint: hint,
      prefixIcon: prefixIcon,
      errorBorder: OutlineInputBorder(
        borderRadius: AppSpacing.borderRadiusMedium,
        borderSide: const BorderSide(
          color: AppColors.error,
          width: 1.5,
        ),
      ),
    );
  }

  // Disabled decoration
  static InputDecoration disabled({
    required String label,
    String? hint,
    Widget? prefixIcon,
  }) {
    return _baseDecoration(
      label: label,
      hint: hint,
      prefixIcon: prefixIcon,
      fillColor: AppColors.inputDisabledBackground,
      labelStyle: AppTypography.labelMedium.copyWith(
        color: AppColors.inputDisabledText,
      ),
    );
  }
}
