import 'package:dartz/dartz.dart';
import 'package:five_line_task/core/errors/failure.dart';
import 'package:flutter/material.dart';

abstract class TasksRepo {
  Future<Either<Failure, Unit>> toggleDone(String docId, bool currentValue);
  Future<Either<Failure, Unit>> addTask(String title, String description);
  Future<Either<Failure, Unit>> deleteTask(String docId); // Add delete method
}