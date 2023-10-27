import 'package:equatable/equatable.dart';
import 'package:flutter_clean_arch_tdd/core/usecase/usecase.dart';
import 'package:flutter_clean_arch_tdd/core/utils/typedef.dart';
import 'package:flutter_clean_arch_tdd/src/authentication/domain/repositories/authentication_repository.dart';

class CreateUser extends UseCaseWithParams<void, CreateUserParams> {
  final AuthenticationRepository _repository;

  const CreateUser(this._repository);

  @override
  ResultVoid call(CreateUserParams params) async => _repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  final String createdAt;
  final String name;
  final String avatar;

  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const CreateUserParams.empty()
      : this(
          createdAt: '_empty.createdAt',
          name: '_empty.createdAt',
          avatar: '_empty.createdAt',
        );

  @override
  List<Object?> get props => [createdAt, name, avatar];
}
