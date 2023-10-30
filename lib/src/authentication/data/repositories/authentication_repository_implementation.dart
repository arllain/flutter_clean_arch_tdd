import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch_tdd/core/errors/failure.dart';
import 'package:flutter_clean_arch_tdd/core/utils/typedef.dart';
import 'package:flutter_clean_arch_tdd/src/authentication/domain/entities/user.dart';
import 'package:flutter_clean_arch_tdd/src/authentication/domain/repositories/authentication_repository.dart';

import '../datasources/authentication_remote_data_source.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final AuthenticationRemoteDataSource _remoteDataSource;
  const AuthenticationRepositoryImplementation(this._remoteDataSource);

  @override
  ResultVoid createUser(
      {required String createdAt,
      required String name,
      required String avatar}) async {
    // Test-Driven Development
    // call the remote data source
    // make sure that it returna the proper data if there is no exception
    // check if the method returns the proper data
    // check if when the remoteDataSource throws an exception, we return a
    // failure and if it doesn't throw an exception, we return the actual expected data
    try {
      await _remoteDataSource.createUser(
          createdAt: createdAt, name: name, avatar: avatar);
      return const Right(null);
    } on APIFailure catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<User>> getUsers() async {
    try {
      final result = await _remoteDataSource.getUsers();
      return Right(result);
    } on APIFailure catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
