import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'get_concrete_number_trivia_test.mocks.dart';

@GenerateMocks([NumberTriviaRepository])

void main() {
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  late GetConcreteNumberTrivia usecase;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(number: tNumber, text: 'test');



  test('Should get trivia for the number from the repository', () async {
    
    when(mockNumberTriviaRepository.getConreteNumberTrivia(tNumber))
        .thenAnswer((_) async => const Right(tNumberTrivia));

    final result = await usecase(const Params(number: tNumber) );

    expect(result, const Right(tNumberTrivia));

    verify(mockNumberTriviaRepository.getConreteNumberTrivia(tNumber));

    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
