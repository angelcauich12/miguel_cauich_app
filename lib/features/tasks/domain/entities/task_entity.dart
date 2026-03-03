import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final int id;
  final String title;
  final bool isCompleted;
  final String? comments;
  final String? description;
  final String? tags;
  final DateTime? date;

  const TaskEntity({
    required this.id,
    required this.title,
    required this.isCompleted,
    this.comments,
    this.tags,
    this.date,
    this.description,
  });

  @override
  List<Object?> get props =>
      [id, title, isCompleted, comments, description, tags, date];
}
