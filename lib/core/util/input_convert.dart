import 'package:curso_tdd_clean_architecture_reso_coder/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class InputConvert {
  Either<Failure, int> stringToUsingnedInterger(String str) {
    try {
      return Right(int.parse(str));
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}
