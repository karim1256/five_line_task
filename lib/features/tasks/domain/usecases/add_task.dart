import 'package:dartz/dartz.dart';
import 'package:five_line_task/core/errors/failure.dart';
import 'package:five_line_task/features/tasks/domain/repo/tasks_repo.dart';

class AddTaskUseCase {
  final TasksRepo repo;

  AddTaskUseCase(this.repo);

  Future<Either<Failure, Unit>> call({
    required String title,
    required String description,
  }) async {
    if (title.isEmpty) {
      return left(ServerFailure('Title is required'));
    }
    return await repo.addTask(title, description);
  }
}