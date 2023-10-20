
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class NumberTriviaLocalDataSource {
  Future<NumberTriviaModel> getlastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
  
}

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) {
    // TODO: implement cacheNumberTrivia
    throw UnimplementedError();
  }

  @override
  Future<NumberTriviaModel> getlastNumberTrivia() {
    // TODO: implement getlastNumberTrivia
    throw UnimplementedError();
  }

}