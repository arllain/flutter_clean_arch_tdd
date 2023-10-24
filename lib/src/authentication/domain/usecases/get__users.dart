import 'package:flutter_clean_arch_tdd/core/usecase/usecase.dart';
import 'package:flutter_clean_arch_tdd/core/utils/typedef.dart';
import 'package:flutter_clean_arch_tdd/src/authentication/domain/entities/user.dart';
import 'package:flutter_clean_arch_tdd/src/authentication/domain/repositories/authentication_repository.dart';

class GetUsers extends UseCaseWithoutParams<List<User>> {
  final AuthenticationRepository _repository;

  GetUsers(this._repository);

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}
