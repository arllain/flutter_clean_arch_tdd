import 'package:flutter_clean_arch_tdd/core/utils/typedef.dart';

abstract class UseCaseWithParams<T, Params> {
  const UseCaseWithParams();

  ResultFuture<void> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();

  ResultFuture<Type> call();
}
