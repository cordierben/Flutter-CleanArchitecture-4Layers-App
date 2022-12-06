import 'package:api/models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDatasource{

  ///Calls the http://numbersapi.com/{number}
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) ;

  ///Calls the http://numbersapi.com/random
  Future<NumberTriviaModel> getRandomNumberTrivia() ;
}