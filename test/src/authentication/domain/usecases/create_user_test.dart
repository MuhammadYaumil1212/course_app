//what does the class depend on
// answer : AuthenticationRepository
//how can we create a fake version of the dependency
// answer : use mocktail
//how do we control what our dependencies do
// answer : use mocktail APIs

import 'package:course_app/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:course_app/src/authentication/domain/usecases/create_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authentication_repository.mock.dart';

void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;
  const params = CreateUserParams.empty();
  setUp(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });
  test('should call the [AuthRepo.createUser]', () async {
    //arrange
    when(() => repository.createUser(
            createdAt: any(named: 'createdAt'),
            name: any(named: 'name'),
            avatar: any(named: 'avatar')))
        .thenAnswer((_) async => const Right(null));
    //act
    final result = await usecase(params);
    //assert
    expect(result, equals(const Right<dynamic, void>(null)));
    verify(() => repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar)).called(1);

    verifyNoMoreInteractions(repository);
  });
}
