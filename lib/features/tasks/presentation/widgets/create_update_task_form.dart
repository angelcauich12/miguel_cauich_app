import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miguel_cauich_app/features/tasks/domain/entities/task_entity.dart';
import 'package:miguel_cauich_app/features/tasks/domain/usecases/create_task_usecase.dart';
import 'package:miguel_cauich_app/features/tasks/presentation/provider/task_provider.dart';
import 'package:provider/provider.dart';

import '../../../../config/theme/app_input_decoration.dart';
import '../../../../config/theme/app_spacing.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../core/validators/input_validators.dart';

class CreateUpdateTaskForm extends StatefulWidget {
  final TaskEntity? task;
  const CreateUpdateTaskForm({super.key, this.task});

  @override
  State<CreateUpdateTaskForm> createState() => _CreateUpdateTaskFormState();
}

class _CreateUpdateTaskFormState extends State<CreateUpdateTaskForm> {
  late TextEditingController _titleController;
  late TextEditingController _commentsController;
  late TextEditingController _descriptionController;
  late TextEditingController _tagsController;
  late bool _isCompleted;
  late DateTime date;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.task?.title ?? '');
    _commentsController =
        TextEditingController(text: widget.task?.comments ?? '');
    _descriptionController =
        TextEditingController(text: widget.task?.description ?? '');
    _tagsController = TextEditingController(text: widget.task?.tags ?? '');
    _isCompleted = widget.task?.isCompleted ?? false;

    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _commentsController.dispose();
    _descriptionController.dispose();
    _tagsController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: AppInputDecoration.textField(label: 'Título'),
                keyboardType: TextInputType.text,
                validator: (value) => InputValidators.validateRequired(value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: AppInputDecoration.textField(label: 'Descripción'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              TextFormField(
                maxLines: 3,
                controller: _commentsController,
                decoration: AppInputDecoration.textField(label: 'Comentarios'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tagsController,
                decoration: AppInputDecoration.textField(label: 'Etiqueta'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('¿Completada?'),
                value: _isCompleted,
                onChanged: (value) => setState(() => _isCompleted = value),
              ),
              const SizedBox(height: 32),
              Consumer<TaskProvider>(
                builder: (contex, prov, _) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (prov.isLoading)
                          ? null
                          : () async {
                              if (!_formKey.currentState!.validate()) return;

                              final params = CreateUpdateTaskParams(
                                  id: widget.task?.id,
                                  title: _titleController.text,
                                  isCompleted: _isCompleted,
                                  comments: _commentsController.text,
                                  description: _descriptionController.text,
                                  tags: _tagsController.text);

                              final readProv = context.read<TaskProvider>();

                              final result = await readProv.createupdateTask(widget.task?.id, params);

                              if (!contex.mounted) return;

                              if (result) {
                                final message = readProv.successTask;
                                SnackbarService.showSuccess(
                                    message ?? 'Tarea creada');
                                contex.pop();
                                return;
                              }

                              final error = readProv.taskFailure?.message;
                              SnackbarService.showError(
                                  error ?? 'Error desconocido');
                              return;
                            },
                      child: prov.isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator.adaptive(
                                  strokeWidth: 2),
                            )
                          : const Text('Guardar'),
                    ),
                  );
                },
              ),
            ],
          )),
    ));
  }
}
