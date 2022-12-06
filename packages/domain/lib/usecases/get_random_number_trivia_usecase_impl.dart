import 'package:domain/models/data_response.dart';
import 'package:domain/repositories/number_trivia_repository.dart';
import 'package:domain/usecases/get_random_number_trivia_usecase.dart';

class GetRandomNumberTriviaUseCaseImpl implements GetRandomNumberTriviaUseCase{
  
  final NumberTriviaRepository repository;
  GetRandomNumberTriviaUseCaseImpl(this.repository);

  @override
  Future<DataResponse> call() async {
    return await repository.getRandomNumberTrivia();
  }
}