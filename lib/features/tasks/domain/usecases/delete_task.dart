import 'package:dartz/dartz.dart';
import 'package:five_line_task/core/errors/failure.dart';
import 'package:five_line_task/features/tasks/domain/repo/tasks_repo.dart';

class DeleteTaskUseCase {
  final TasksRepo repo;

  DeleteTaskUseCase(this.repo);

  Future<Either<Failure, Unit>> call({required String docId}) {
    return repo.deleteTask(docId);
  }
}