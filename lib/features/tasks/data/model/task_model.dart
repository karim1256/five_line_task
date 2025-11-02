import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_line_task/features/tasks/domain/entity/task_entity.dart';

class TaskModel extends TaskEntity {
  bool isDone;
  Timestamp? createdAt;

  TaskModel({
    required super.taskId,
    required super.title,
    required super.description,
    this.isDone = false,
    this.createdAt,
  });

  factory TaskModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TaskModel(
      taskId: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      isDone: data['isDone'] ?? false,
      createdAt: data['createdAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isDone': isDone,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
    };
  }
}