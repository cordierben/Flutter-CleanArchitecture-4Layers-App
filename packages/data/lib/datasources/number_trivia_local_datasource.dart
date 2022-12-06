import 'dart:convert';

import 'package:data/models/number_trivia_model.dart';
import 'package:domain/models/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NumberTriviaLocalDatasource {

  ///Calls the http://numbersapi.com/{number}
  Future<NumberTriviaModel> getLastNumberTrivia();

  ///Calls the http://numbersapi.com/random
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCahce);
}

const CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDatasource {

  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final jsonString = sharedPreferences.getString('CACHED_NUMBER_TRIVIA');
    if (jsonString != null) {
      return Future.value(NumberTriviaModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheExceptions();
    }
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) {
    return sharedPreferences.setString(CACHED_NUMBER_TRIVIA,jsonEncode(triviaToCache.toJson()),);
  }
}