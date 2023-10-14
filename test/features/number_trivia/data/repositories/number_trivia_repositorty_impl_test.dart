import 'package:curso_tdd_clean_architecture_reso_coder/core/plataform/network_info.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/repositories/number_trivia_repositorty_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockRemoteDataSource extends Mock implements NumberTriviaRemoteDataSource{}
class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

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
      //repository: mockRemoteDataSource,
    );
  });
  testWidgets('number trivia repositorty impl ...', (tester) async {
    
  });
}