import 'package:fpdart/fpdart.dart';

import '../ui_helper/logger.dart';
import 'err.dart';
import 'failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
typedef FutureEitherBool = FutureEither<bool>;
typedef FutureEitherString = FutureEither<String>;
typedef FutureEitherInt = FutureEither<int>;

Either<Failure, T> returnFailure<T>(String methodName, Object e, StackTrace st) {
  Logger.red('[$methodName] Error: ${getErrorMessage(e)} \nStackTrace: ${st.toString()}');
  return left(
    Failure(
      message: getErrorMessage(e),
      stackTrace: st,
    ),
  );
}
