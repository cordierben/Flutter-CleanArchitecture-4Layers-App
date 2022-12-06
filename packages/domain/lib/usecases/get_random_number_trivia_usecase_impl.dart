import 'package:api/get_random_number_trivia_usecase.dart';
import 'package:api/models/data_response.dart';
import 'package:api/number_trivia_repository.dart';

class GetRandomNumberTriviaUseCaseImpl implements GetRandomNumberTriviaUseCase{
  
  final NumberTriviaRepository repository;
  GetRandomNumberTriviaUseCaseImpl(this.repository);

  @override
  Future<DataResponse> call() async {
    return await repository.getRandomNumberTrivia();
  }
}