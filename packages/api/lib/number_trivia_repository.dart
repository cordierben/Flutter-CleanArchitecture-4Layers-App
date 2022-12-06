import 'models/data_response.dart';

abstract class NumberTriviaRepository {
  Future<DataResponse> getConcreteNumberTrivia(int number);
  getRandomNumberTrivia();
}