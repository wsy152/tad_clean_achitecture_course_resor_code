import 'dart:convert';

import 'package:curso_tdd_clean_architecture_reso_coder/core/error/exceptions.dart';
import 'package:curso_tdd_clean_architecture_reso_coder/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:http/http.dart' as http;

abstract interface class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final http.Client client;

  NumberTriviaRemoteDataSourceImpl({required this.client});
  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) => _getTriviaFromUrl(Uri.http('http://numbersapi.com/$number'));
    
  
  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() => _getTriviaFromUrl(Uri.http('http://numbersapi.com/random'));


  Future<NumberTriviaModel> _getTriviaFromUrl(Uri url) async {
    final response =
        await client.get(url, headers: {
      'Content_Type': 'application/json',
    });

    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }

  }
}
