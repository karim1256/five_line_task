import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:five_line_task/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:five_line_task/features/tasks/presentation/widgets/edit_task.dart';
import 'package:flutter/material.dart';
import 'package:five_line_task/features/tasks/presentation/widgets/task_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksBody extends StatelessWidget {
  const TasksBody({super.key});

  @override
  Widget build(BuildContext context) {
    final tasksRef = FirebaseFirestore.instance.collection('tasks');

    return StreamBuilder<QuerySnapshot>(
      stream: tasksRef.orderBy('title').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(AppStrings.someThingWentWrong.tr()));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data!.docs;

        if (docs.isEmpty) {
          return const Center(
            child: Text(
              'No tasks yet ',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final task = docs[index];
            final data = task.data() as Map<String, dynamic>;

            return TaskTile(
              id: task.id,
              title: data['title'] ?? '',
              description: data['description'],
              isDone: data['isDone'] ?? false,
              onToggle: () => 
                context.read<TasksCubit>().toggleTaskState(
                  taskId: task.id, 
                  currentState: data['isDone'] ?? false
                ),
              onTap: () => editTask(
                context,
                task.id,
                data['title'] ?? '',
                data['description'],
              ),
              onDelete: () => 
                context.read<TasksCubit>().deleteTask(task.id), // Add delete callback
            );
          },
        );
      },
    );
  }
}