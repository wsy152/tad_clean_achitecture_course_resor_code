import 'package:curso_tdd_clean_architecture_reso_coder/core/error/failures.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/core/plataform/network_info.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

class NumberTriviaRepositortyImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositortyImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, NumberTrivia>> getConreteNumberTrivia(int number) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    throw UnimplementedError();
  }
}
