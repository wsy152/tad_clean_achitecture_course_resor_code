import 'package:curso_tdd_clean_architecture_reso_coder/core/util/input_convert.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  late InputConvert inputConvert;


  setUp(() {
    inputConvert = InputConvert();

  });
group('StringToUnsingedInt', ()  { 

  test('Should an integer when the string represents an usingned integer', () async{
    const str = '123';

    final result =  inputConvert.stringToUsingnedInterger(str);

    expect(result, const Right(123));
  });

  test('should return a Failure when the string is not an integer', () {
    const str = 'abc';

      final result = inputConvert.stringToUsingnedInterger(str);

      expect(result,  Left(InvalidInputFailure()));
  });

});
}