import 'package:five_line_task/common/helpers.dart/is_dark_mode.dart';
import 'package:five_line_task/core/constants/theme/app_colors.dart';
import 'package:five_line_task/core/constants/theme/app_text.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String id;
  final String title;
  final String? description;
  final bool isDone;
  final VoidCallback onToggle;
  final VoidCallback? onTap;
  final VoidCallback onDelete; // Add delete callback

  const TaskTile({
    super.key,
    required this.id,
    required this.title,
    this.description,
    required this.isDone,
    required this.onToggle,
    this.onTap,
    required this.onDelete, // Required delete callback
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        onLongPress: () => _showDeleteDialog(context), // Long press to delete
        leading: Checkbox(
          value: isDone,
          onChanged: (_) => onToggle(),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          activeColor: AppColors.primary,
        ),
        title: Text(
          title,
          style: context.isDarkMode
              ? AppTextTheme.headingMediumBold
              : AppTextTheme.headingLightBold,
        ),
        subtitle: description != null && description!.isNotEmpty
            ? Text(
                description!,
                style: context.isDarkMode
                    ? AppTextTheme.bodySmallGrey
                    : AppTextTheme.bodySmallLight,
              )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _showDeleteDialog(context),
            ),
            const Icon(Icons.edit, color: AppColors.primary),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Task'),
          content: Text('Are you sure you want to delete "$title"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onDelete();
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}