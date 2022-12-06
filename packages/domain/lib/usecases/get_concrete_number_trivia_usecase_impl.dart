import 'package:domain/models/data_response.dart';
import 'package:domain/models/number_trivia.dart';
import 'package:domain/repositories/number_trivia_repository.dart';
import 'package:domain/usecases/get_concrete_number_trivia_usecase.dart';

class GetConcreteNumberTriviaUseCaseImpl implements GetConcreteNumberTriviaUseCase {
  final NumberTriviaRepository repository;

  GetConcreteNumberTriviaUseCaseImpl(this.repository);

  @override
  Future<DataResponse> call(int number) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}