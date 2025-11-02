import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart'; 
import 'package:five_line_task/core/errors/failure.dart';
import 'package:five_line_task/features/tasks/domain/repo/tasks_repo.dart';

class UpdateTaskUseCase {
  final TasksRepo repo;

  UpdateTaskUseCase(this.repo);

  Future<Either<Failure, Unit>> call({
    required String docId,
    required String title,
    required String description,
  }) async {
    if (title.isEmpty) {
      return left(ServerFailure('Title is required'.tr())); // Added .tr()
    }
    return await repo.updateTask(docId, title, description);
  }
}