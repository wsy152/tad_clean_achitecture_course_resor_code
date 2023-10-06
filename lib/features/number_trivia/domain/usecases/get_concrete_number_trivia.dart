
import 'package:curso_tdd_clean_architecture_reso_coder/core/error/failures.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/core/usecases/usecase.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);
  
  @override
  Future<Either<Failure,NumberTrivia>> call(Params params)async{
   return await  repository.getConreteNumberTrivia(params.number);

  }
}

class Params extends Equatable {
  final int number;

  const Params({required this.number});

  @override
  List<Object?> get props => [number];
}
