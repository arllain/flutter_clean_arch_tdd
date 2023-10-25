import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch_tdd/src/authentication/domain/entities/user.dart';
import 'package:flutter_clean_arch_tdd/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:flutter_clean_arch_tdd/src/authentication/domain/usecases/get__users.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'create_user_test.dart';

void main() {
  late AuthenticationRepository repository;
  late GetUsers usecase;

  setUp(() {
    repository = MockAuthRepo();
    usecase = GetUsers(repository);
  });

  const tResponse = [User.empty()];

  test(
    'should call the  [AuthenticationRepository.getUsers] and return [List<Users>]',
    () async {
      // Arrange
      when(() => repository.getUsers()).thenAnswer(
        (_) async => const Right(tResponse),
      );

      // Act
      final result = await usecase();

      expect(result, equals(const Right<dynamic, List<User>>(tResponse)));

      verify(() => repository.getUsers()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
