import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MockSharedPreferences extends Mock implements SharedPreferences{}

void main() {
  late NumberTriviaLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;


  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource =NumberTriviaLocalDataSourceImpl(sharedPreferences:  mockSharedPreferences);

  });
  test('number trivia local data source ...', () async {

    dataSource.sharedPreferences;



  });
}