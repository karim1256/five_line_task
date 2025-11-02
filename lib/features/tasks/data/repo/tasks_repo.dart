import 'package:dartz/dartz.dart';
import 'package:five_line_task/core/errors/exception.dart';
import 'package:five_line_task/core/errors/failure.dart';
import 'package:five_line_task/features/tasks/data/source/tasks_firebase.dart';
import 'package:five_line_task/features/tasks/domain/repo/tasks_repo.dart';

class TasksRepoImpl implements TasksRepo {
  final TasksFirebase tasksFirebase;
  
  TasksRepoImpl({required this.tasksFirebase});
  
  @override
  Future<Either<Failure, Unit>> addTask(String title, String description) async {
    try {
      await tasksFirebase.addTask(title, description: description);
      return right(unit);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, Unit>> toggleDone(String docId, bool currentValue) async {
    try {
      await tasksFirebase.toggleDone(docId, currentValue);
      return right(unit);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTask(String docId) async {
    try {
      await tasksFirebase.deleteTask(docId);
      return right(unit);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}