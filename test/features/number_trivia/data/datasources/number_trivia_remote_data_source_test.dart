import 'dart:convert';

import 'package:curso_tdd_clean_architecture_reso_coder/core/error/exceptions.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:http/http.dart' as http;

import '../../../../fixtures/fixture_reader.dart';
import 'number_trivia_remote_data_source_test.mocks.dart';
// import 'package:mockito/annotations.dart';

// @GenerateNiceMocks([MockHttpClient])

@GenerateNiceMocks([MockSpec<http.Client>(as: #MockHttpClient)])

// class MockHttpClient extends Mock implements http.Client{}

void main() {
  late NumberTriviaRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();

    dataSource = NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('something went wrong'), 404));
  }

  group('getConcreteNumberTrivia ...', () async {
    const tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));
    // when( dataSource.client);

    test('''should perform a GET request on a URL with number being the 
   endpoint and with application/json header''', () async {
      setUpMockHttpClientSuccess200();

      dataSource.getConcreteNumberTrivia(tNumber);

      verify(mockHttpClient
          .get(Uri.http('http://numbersapi.com/$tNumber'), headers: {
        'Content_Type': 'application/json',
      }));
    });

    test('should return NumberTrivia when the response code is 200 (success)',
        () async {
      setUpMockHttpClientSuccess200();

      final result = await dataSource.getConcreteNumberTrivia(tNumber);

      expect(result, equals(tNumberTriviaModel));
    });

    test(
        'should throw a serverException when the response code is 404 or other',
        () async {
      setUpMockHttpClientFailure404();

      final call = dataSource.getConcreteNumberTrivia;

      expect(() => call(tNumber), const TypeMatcher<ServerException>());
    });
  });

    group('getRandomNumberTrivia ...', () async {

    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));
    // when( dataSource.client);

    test('''should perform a GET request on a URL with number being the 
   endpoint and with application/json header''', () async {
      setUpMockHttpClientSuccess200();

      dataSource.getRandomNumberTrivia();

      verify(mockHttpClient
          .get(Uri.http('http://numbersapi.com/random'), headers: {
        'Content_Type': 'application/json',
      }));
    });

    test('should return NumberTrivia when the response code is 200 (success)',
        () async {
      setUpMockHttpClientSuccess200();

      final result = await dataSource.getRandomNumberTrivia();

      expect(result, equals(tNumberTriviaModel));
    });

    test(
        'should throw a serverException when the response code is 404 or other',
        () async {
      setUpMockHttpClientFailure404();

      final call = dataSource.getConcreteNumberTrivia;

      expect(() => call, const TypeMatcher<ServerException>());
    });
  });
}
