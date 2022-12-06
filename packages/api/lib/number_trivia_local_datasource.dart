import 'package:api/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDatasource {

  ///Calls the http://numbersapi.com/{number}
  Future<NumberTriviaModel> getLastNumberTrivia();

  ///Calls the http://numbersapi.com/random
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCahce);
}