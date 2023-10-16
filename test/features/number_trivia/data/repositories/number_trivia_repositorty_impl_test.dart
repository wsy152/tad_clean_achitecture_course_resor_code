import 'package:curso_tdd_clean_architecture_reso_coder/core/plataform/network_info.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/repositories/number_trivia_repositorty_impl.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'number_trivia_repositorty_impl_test.mocks.dart';

@GenerateMocks([NetworkInfo])
@GenerateNiceMocks([
  MockSpec<NumberTriviaRemoteDataSource>(as: #MockRemoteDataSource),
  MockSpec<NumberTriviaLocalDataSource>(as: #MockLocalDataSource)
])

void main() {
  late NumberTriviaRepositortyImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NumberTriviaRepositortyImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
  group('getComcreteNumberTrivia', () {
    const tNumber = 1;
    const tNumberTrivialModel =
        NumberTriviaModel(number: tNumber, text: 'test trivia');
    const NumberTrivia tNumberTrivia = tNumberTrivialModel;
    test('shold check if the device is onLine', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      repository.getConreteNumberTrivia(tNumber);

      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'shold return remote data when the call to remote data source is success',
          () async {
        when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
            .thenAnswer((_) async => tNumberTrivialModel);

        final result = await repository.getConreteNumberTrivia(tNumber);

        verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));

        expect(result, equals(const Right(tNumberTrivia)));
      });

      test(
          'should chach locally data when the call to remote data source is success',
          () async {
        when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
            .thenAnswer((_) async => tNumberTrivialModel);

        await repository.getConreteNumberTrivia(tNumber);

        verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));

        verify(mockLocalDataSource.cacheNumberTrivia(tNumberTrivialModel));
      });
    });
  });
  group('device is offline', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });
  });
}
