import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_line_task/core/errors/exception.dart';

abstract class TasksFirebase {
  Future<void> toggleDone(String docId, bool currentValue);
  Future<void> addTask(String title, {String description = ''});
  Future<void> deleteTask(String docId); // Add delete method
}

class FirebaseTasksManage extends TasksFirebase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addTask(String title, {String description = ''}) async {
    try {
      if (title.isEmpty) {
        throw CustomException(message:'Title is required');
      }

      await _firestore.collection('tasks').add({
        'title': title,
        'description': description,
        'isDone': false,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw CustomException(message:'Failed to add task: ${e.toString()}');
    }
  }

  @override
  Future<void> toggleDone(String docId, bool currentValue) async {
    try {
      await _firestore.collection('tasks').doc(docId).update({
        'isDone': !currentValue,
      });
    } catch (e) {
      throw CustomException(message:'Failed to toggle task: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteTask(String docId) async {
    try {
      await _firestore.collection('tasks').doc(docId).delete();
    } catch (e) {
      throw CustomException(message:'Failed to delete task: ${e.toString()}');
    }
  }
}