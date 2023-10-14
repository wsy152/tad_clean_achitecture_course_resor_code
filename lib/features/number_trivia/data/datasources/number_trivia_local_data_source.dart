
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/models/number_trivia_model.dart';

abstract interface class NumberTriviaLocalDataSource {
  Future<NumberTriviaModel> getlastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
  
}