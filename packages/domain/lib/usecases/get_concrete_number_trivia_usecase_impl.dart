import 'package:api/get_concrete_number_trivia_usecase.dart';
import 'package:api/models/data_response.dart';
import 'package:api/number_trivia_repository.dart';

class GetConcreteNumberTriviaUseCaseImpl implements GetConcreteNumberTriviaUseCase {
  final NumberTriviaRepository repository;

  GetConcreteNumberTriviaUseCaseImpl(this.repository);

  @override
  Future<DataResponse> call(int number) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}