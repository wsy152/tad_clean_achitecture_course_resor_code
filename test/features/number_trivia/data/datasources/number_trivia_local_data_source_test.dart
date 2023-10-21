import 'dart:convert';

import 'package:curso_tdd_clean_architecture_reso_coder/core/error/exceptions.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'number_trivia_local_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])


// class MockSharedPreferences extends Mock implements SharedPreferences{}

void main() {
  late NumberTriviaLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;


  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource =NumberTriviaLocalDataSourceImpl(sharedPreferences:  mockSharedPreferences);

  });

  group('getLastNumberTrivia', () {
     final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia_cached.json')));
      test(
        'should return numberTrivia from sharedPreferences when there is one in the cache',
        () async {
      
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture('trivia_cached.json'));

      final result = await dataSource.getLastNumberTrivia();

      verify(mockSharedPreferences.getString('CACHED_NUMBER_TRIVA'));

      expect(result, equals(tNumberTriviaModel));
    });

      test(
        'should throw a CacheException when there is not a cached value',
        () async {
     

      when(mockSharedPreferences.getString(any))
          .thenReturn(null);

      expect(()=> dataSource.getLastNumberTrivia(), throwsA(const TypeMatcher<CacheException>()));
    });
   });


   group('chacheNumberTrivia', () {
    const tNumberTriviaModel = NumberTriviaModel(text: 'teste trivia', number: 2);

    test('should call SharedPreferences to cache the data', () {

      dataSource.cacheNumberTrivia(tNumberTriviaModel);
      final expectedJsonString = json.encode(tNumberTriviaModel.toJson());

      verify(mockSharedPreferences.setString('CACHED_NUMBER_TRIVA', expectedJsonString));

      

    });
    });

}