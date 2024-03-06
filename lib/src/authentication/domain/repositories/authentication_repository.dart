
import 'package:course_app/core/errors/failure.dart';
import 'package:course_app/core/utils/typedef.dart';
import 'package:course_app/src/authentication/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository{
  const AuthenticationRepository();
  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar
  });

  ResultFuture<List<User>>getUser();
}