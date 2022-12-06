import 'dart:convert';

import 'package:data/models/number_trivia_model.dart';
import 'package:domain/models/exceptions.dart';
import 'package:dio/dio.dart';

abstract class NumberTriviaRemoteDatasource{

  ///Calls the http://numbersapi.com/{number}
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) ;

  ///Calls the http://numbersapi.com/random
  Future<NumberTriviaModel> getRandomNumberTrivia() ;
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDatasource {

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) =>
      _getTriviaFromUrl('http://numbersapi.com/$number');

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() =>
      _getTriviaFromUrl('http://numbersapi.com/random');

  Future<NumberTriviaModel> _getTriviaFromUrl(String url) async {
    final response = await Dio().get(url);
    final responseString = response.toString();
    if (response.statusCode == 200) {
      int idx = responseString.indexOf(" ");
      List parts = [responseString.substring(0,idx).trim(), responseString.substring(idx+1).trim()];
      Map<String, dynamic> map1 = {"text": parts[1],"number": parts[0]};
      return NumberTriviaModel.fromJson(map1);
    } else {
      throw ServerExceptions();
    }
  }
}