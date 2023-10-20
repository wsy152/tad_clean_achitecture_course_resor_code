import 'package:curso_tdd_clean_architecture_reso_coder/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])


//class MockDataConnectionChecker extends Mock implements InternetConnectionChecker{}


void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionChecker mockDataConnectionChecker;


  setUp((){
    mockDataConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(connectionChecker: mockDataConnectionChecker);
  });
  group('isConnected ...', ()  {

    test('should forward the call to DataCoonectionChecker.hasCoonection', () async {
      when(mockDataConnectionChecker.hasConnection)
      .thenAnswer((_) async => true);

      final result = await networkInfo.isConnected;

      verify(mockDataConnectionChecker.hasConnection);

      expect(result, true);
  
    });

    test('should forward the call to DataCoonectionChecker.hasCoonection',
        () async {

          final tHasConnectionFuture = Future.value(true);


      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_)  => tHasConnectionFuture);

      final result =  networkInfo.isConnected;

      verify(mockDataConnectionChecker.hasConnection);

      expect(result, tHasConnectionFuture);
    });
   
  });
}