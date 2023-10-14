
import 'package:curso_tdd_clean_architecture_reso_coder/core/error/failures.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

class NumberTriviaRepositortyImpl implements NumberTriviaRepository{
  @override
  Future<Either<Failure, NumberTrivia>> getConreteNumberTrivia(int number) {

    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {

    throw UnimplementedError();
  }
  
}