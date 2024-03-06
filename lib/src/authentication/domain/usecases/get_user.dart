import 'package:course_app/core/usecase/usecase.dart';
import 'package:course_app/core/utils/typedef.dart';
import 'package:course_app/src/authentication/domain/entities/user.dart';
import 'package:course_app/src/authentication/domain/repositories/authentication_repository.dart';

class GetUser extends UsecaseWithoutParams<List<User>>{
  GetUser(this._repository);
  final AuthenticationRepository _repository;
  @override
  ResultFuture<List<User>>call()async => _repository.getUser();
}