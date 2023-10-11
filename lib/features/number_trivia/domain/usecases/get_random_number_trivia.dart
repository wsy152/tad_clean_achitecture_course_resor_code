
import 'package:curso_tdd_clean_architecture_reso_coder/core/error/failures.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/core/usecases/usecase.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams>{
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}


class NoParams extends Equatable{
  @override

  List<Object?> get props => throw UnimplementedError();
}