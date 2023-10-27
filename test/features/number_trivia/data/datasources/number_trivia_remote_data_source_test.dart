import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
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

    dataSource = NumberTriviaRemoteDataSourceImpl(client:mockHttpClient);



  });


  group('getConcreteNumberTrivia ...', () async {
    const tNumber = 1;
   // when( dataSource.client);

   test(
   '''should perform a GET request on a URL with number being the 
   endpoint and with application/json header''', () async {
       when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('trivia.json'),200));

          dataSource.getConcreteNumberTrivia(tNumber);

          verify(mockHttpClient
          .get(Uri.http('http://numbersapi.com/$tNumber'), headers: {
        'Content_Type': 'application/json',
      }));


   });

  });
}