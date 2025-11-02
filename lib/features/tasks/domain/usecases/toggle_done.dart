import 'package:dartz/dartz.dart';
import 'package:five_line_task/core/errors/failure.dart';

import 'package:five_line_task/features/tasks/domain/repo/tasks_repo.dart';

class ToggleDoneCase {
  final TasksRepo repo;

  ToggleDoneCase(this.repo);

  Future<Either<Failure, Unit>> call({required String docId, required bool currentValue}) {
    return repo.toggleDone(docId, currentValue,);
  }
}
