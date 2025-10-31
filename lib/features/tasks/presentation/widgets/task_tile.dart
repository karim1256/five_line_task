import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String id;
  final String title;
  final String? description;
  final bool isDone;
  final VoidCallback onToggle;
  final VoidCallback? onTap;

  const TaskTile({
    super.key,
    required this.id,
    required this.title,
    this.description,
    required this.isDone,
    required this.onToggle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        leading: Checkbox(
          value: isDone,
          onChanged: (_) => onToggle(),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        title: Text(
          title,
          style: TextStyle(
            decoration: isDone ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: description != null && description!.isNotEmpty
            ? Text(description!)
            : null,
        trailing: const Icon(Icons.edit, color: Colors.grey),
      ),
    );
  }
}
