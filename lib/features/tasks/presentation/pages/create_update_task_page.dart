import 'package:flutter/material.dart';
import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';
import 'package:miguel_cauich_app/features/tasks/presentation/widgets/create_update_task_form.dart';

class CreateUpdateTaskPage extends StatelessWidget {
  final TaskEntity? task;
  const CreateUpdateTaskPage({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(task == null ? 'Nueva Tarea' : 'Editar Tarea'),
        ),
        body: CreateUpdateTaskForm(task: task));
  }
}
