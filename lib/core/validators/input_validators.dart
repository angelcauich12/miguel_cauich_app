class InputValidators {
  static const String _emailPattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';

  static const String _phonePattern =
      r'^[+]?[(]?[0-9]{3}[)]?[-\s.]?[0-9]{3}[-\s.]?[0-9]{4,6}$';

  static const String _urlPattern =
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$';

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'El email es obligatorio';
    }

    final emailRegex = RegExp(_emailPattern);
    if (!emailRegex.hasMatch(value)) {
      return 'Ingresa un email válido';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña es obligatoria';
    }

    if (value.length < 8) {
      return 'La contraseña debe tener al menos 8 caracteres';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'La contraseña debe contener al menos una mayúscula';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'La contraseña debe contener al menos una minúscula';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'La contraseña debe contener al menos un número';
    }

    return null;
  }

  static String? validateConfirmPassword(String? password, String? confirm) {
    if (confirm == null || confirm.isEmpty) {
      return 'Confirma tu contraseña';
    }

    if (password != confirm) {
      return 'Las contraseñas no coinciden';
    }

    return null;
  }

  /// Valida formato de teléfono internacional básico
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'El teléfono es obligatorio';
    }

    final phoneRegex = RegExp(_phonePattern);
    if (!phoneRegex.hasMatch(value)) {
      return 'Ingresa un teléfono válido';
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'campo obligatorio';
    }

    if (value.length < 2) {
      return 'El nombre debe tener al menos 2 caracteres';
    }

    if (value.length > 50) {
      return 'El nombre no puede exceder 50 caracteres';
    }

    return null;
  }

  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'La URL es obligatoria';
    }

    final urlRegex = RegExp(_urlPattern);
    if (!urlRegex.hasMatch(value)) {
      return 'Ingresa una URL válida';
    }

    return null;
  }

  static String? validateNumber(String? value, {int? min, int? max}) {
    if (value == null || value.isEmpty) {
      return 'Este campo es obligatorio';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Solo se permiten números';
    }

    if (min != null) {
      final number = int.parse(value);
      if (number < min) {
        return 'El valor debe ser mayor a $min';
      }
    }

    if (max != null) {
      final number = int.parse(value);
      if (number > max) {
        return 'El valor debe ser menor a $max';
      }
    }

    return null;
  }

  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'este campo es obligatorio';
    }

    return null;
  }

  static String? validateTextField(
    String? value, {
    required String fieldName,
    int minLength = 1,
    int maxLength = 1000,
  }) {
    if (value == null || value.isEmpty) {
      return '$fieldName es obligatorio';
    }

    if (value.length < minLength) {
      return '$fieldName debe tener al menos $minLength caracteres';
    }

    if (value.length > maxLength) {
      return '$fieldName no puede exceder $maxLength caracteres';
    }

    return null;
  }

  /// Validación de usuario (puede ser email o username)
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'El usuario es obligatorio';
    }

    if (value.length < 3) {
      return 'El usuario debe tener al menos 3 caracteres';
    }

    if (value.length > 20) {
      return 'El usuario no puede exceder 20 caracteres';
    }

    if (!RegExp(r'^[a-zA-Z0-9_.-]+$').hasMatch(value)) {
      return 'El usuario solo puede contener letras, números, puntos, guiones y guiones bajos';
    }

    return null;
  }

  static String? validatePostalCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'El código postal es obligatorio';
    }

    if (!RegExp(r'^[0-9]{4,10}$').hasMatch(value)) {
      return 'Ingresa un código postal válido';
    }

    return null;
  }
}
