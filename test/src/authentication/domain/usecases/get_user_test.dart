import 'package:course_app/src/authentication/domain/entities/user.dart';
import 'package:course_app/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:course_app/src/authentication/domain/usecases/get_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authentication_repository.mock.dart';

void main() {
  late AuthenticationRepository repository;
  late GetUser usecase;
  setUp(() {
    repository = MockAuthRepo();
    usecase = GetUser(repository);
  });
  const tResponse = [User.empty()];
  test('should call the [AuthRepo.getUser] and return [list<user>]', () async {
    //arrange
    when(() => repository.getUser())
        .thenAnswer((_) async => const Right(tResponse));
    final result = await usecase();
    expect(result, equals(const Right<dynamic, List<User>>(tResponse)));
    verify(() => repository.getUser()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
