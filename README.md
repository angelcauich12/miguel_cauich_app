## Task Management App - Miguel Cauich
Aplicación de gestión de tareas desarrollada con Flutter siguiendo los principios de Clean Architecture y SOLID.

# Arquitectura y Patrones
Este proyecto está dividido en capas para garantizar la escalabilidad, testabilidad y el desacoplamiento:

- Domain (Dominio): Contiene la lógica de negocio pura (Entities, Use Cases y contratos de Repositorios). Es independiente de cualquier librería o framework.

- Data (Datos): Implementaciones de los repositorios, Data Sources (API Remota) y Modelos.

- Presentation (Presentación): Gestión de estado mediante Provider y navegación reactiva.

- Core: Utilidades transversales como manejo de errores (Either de dartz), interceptores de red y servicios comunes.

# Tecnologías Principales

- Dio: Cliente HTTP con interceptores para manejo global de autenticación (token).

- GetIt: Localizador de servicios para la Inyección de Dependencias.

- Provider: Gestión de estado reactiva y eficiente.

- GoRouter: Navegación avanzada basada en rutas declarativas y parámetros dinámicos.

- Dartz: Programación funcional para el manejo de errores mediante el tipo Either (Failure o Success).

# Decisiones Técnicas
Manejo de API Inconsistente: Se implementaron factories en los modelos para normalizar datos de la API (ej: conversión de int o null a bool para is_completed).

Seguridad Centralizada: Uso de un interceptor en Dio que inyecta automáticamente el Authorization Bearer y el token de usuario en todas las peticiones.

# UX:

- Sincronización local de la lista tras Crear/Editar/Eliminar para evitar peticiones innecesarias al servidor.

- Confirmación de borrado con estados de carga (loading) en botones.

- Formularios con validación en tiempo real.

# Requisitos Previos
Flutter (Versión 3.x o superior)

Dart (Versión 3.x)

# Instalación y Ejecución
Clonar el repositorio.

Ejecutar flutter pub get para instalar dependencias.

Lanzar la app con flutter run.
