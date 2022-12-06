import 'package:api/models/data_response.dart';
import 'package:api/models/number_trivia.dart';
import 'package:api/number_trivia_repository.dart';
import 'package:domain/usecases/get_random_number_trivia_usecase_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository{}

void main() {
  late GetRandomNumberTriviaUseCaseImpl usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp((){
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTriviaUseCaseImpl(mockNumberTriviaRepository);
  });

  final tNumberTrivia = NumberTrivia(text: "Dummy Text", number: 1);

  test('should get trivia from from the repository', () async{
    when(mockNumberTriviaRepository.getRandomNumberTrivia())
    .thenAnswer((_) async => DataResponse(numberTrivia: tNumberTrivia, failures: null));
    final result = await usecase();
    expect(result.numberTrivia.number, DataResponse(numberTrivia: tNumberTrivia, failures: null).numberTrivia.number);
    verify(mockNumberTriviaRepository.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}