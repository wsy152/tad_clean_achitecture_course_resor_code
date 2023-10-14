import 'dart:convert';

import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tNumberTrivialModel = NumberTriviaModel(number: 2, text: 'Test text');
  test('numero trivia model ...', () async {
   


   expect(tNumberTrivialModel, isA<NumberTrivia>());
  });

  group('fromJson', () { 
    test('Should return a valid model', () async {

      final Map<String,dynamic> jsonMap = json.decode(fixture('trivia.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);

      expect(result, tNumberTrivialModel);

    });

        test('Should return a valid model double', () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.double.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);

      expect(result, tNumberTrivialModel);
    });
  });

  group('toJson', () {

test('should return a JSON map containing the proper data', () async {
  final result = tNumberTrivialModel.toJson();

  final expetedMap =  {"text": "Test text", "number": 2};

  expect(result,expetedMap);

});

   });
}