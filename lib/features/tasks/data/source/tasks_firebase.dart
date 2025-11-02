import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:five_line_task/core/errors/exception.dart';

abstract class TasksFirebase {
  Future<void> toggleDone(String docId, bool currentValue);
  Future<void> addTask(String title, {String description = ''});
  Future<void> deleteTask(String docId);
  Future<void> updateTask(String docId, String title, String description); // Add this
}

class FirebaseTasksManage extends TasksFirebase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addTask(String title, {String description = ''}) async {
    try {
      if (title.isEmpty) {
        throw CustomException(message: 'Title is required'.tr()); // Added .tr()
      }

      await _firestore.collection('tasks').add({
        'title': title,
        'description': description,
        'isDone': false,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw CustomException(message: 'Failed to add task: ${e.toString()}'.tr()); // Added .tr()
    }
  }

  @override
  Future<void> toggleDone(String docId, bool currentValue) async {
    try {
      await _firestore.collection('tasks').doc(docId).update({
        'isDone': !currentValue,
      });
    } catch (e) {
      throw CustomException(message: 'Failed to toggle task: ${e.toString()}'.tr()); // Added .tr()
    }
  }

  @override
  Future<void> deleteTask(String docId) async {
    try {
      await _firestore.collection('tasks').doc(docId).delete();
    } catch (e) {
      throw CustomException(message: 'Failed to delete task: ${e.toString()}'.tr()); // Added .tr()
    }
  }

  @override
  Future<void> updateTask(String docId, String title, String description) async {
    try {
      if (title.isEmpty) {
        throw CustomException(message: 'Title is required'.tr()); // Added .tr()
      }

      await _firestore.collection('tasks').doc(docId).update({
        'title': title,
        'description': description.isEmpty ? null : description,
      });
    } catch (e) {
      throw CustomException(message: 'Failed to update task: ${e.toString()}'.tr()); // Added .tr()
    }
  }
}