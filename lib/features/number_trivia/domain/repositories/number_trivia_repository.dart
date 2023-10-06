import 'package:curso_tdd_clean_architecture_reso_coder/core/error/failures.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
abstract interface class NumberTriviaRepository {

Future<Either<Failure,NumberTrivia>> getConreteNumberTrivia(int number);

 Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();

}