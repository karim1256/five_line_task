import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

void editTask(
  BuildContext context,
  String docId,
  String title,
  String? description,
) {
  final TextEditingController titleController = TextEditingController(
    text: title,
  );
  final TextEditingController descriptionController = TextEditingController(
    text: description ?? '',
  );

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          left: 16,
          right: 16,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.editTask.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: titleController,
              decoration:  InputDecoration(
                labelText: '${AppStrings.title.tr()}*',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: descriptionController,
              decoration:  InputDecoration(
                labelText: AppStrings.description.tr(),
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () async {
                final newTitle = titleController.text.trim();
                final newDescription = descriptionController.text.trim();

                if (newTitle.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text(AppStrings.titleCannotBeEmpty.tr())),
                  );
                  return;
                }

                await FirebaseFirestore.instance
                    .collection('tasks')
                    .doc(docId)
                    .update({
                      'title': newTitle,
                      'description': newDescription.isEmpty
                          ? null
                          : newDescription,
                    });

                Navigator.pop(context);
              },
              icon: const Icon(Icons.save),
              label:  Text(AppStrings.saveChanges.tr()),
            ),
          ],
        ),
      );
    },
  );
}
