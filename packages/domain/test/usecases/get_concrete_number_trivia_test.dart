import 'package:api/models/data_response.dart';
import 'package:api/models/number_trivia.dart';
import 'package:api/number_trivia_repository.dart';
import 'package:domain/usecases/get_concrete_number_trivia_usecase_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository{}

void main() {
  late GetConcreteNumberTriviaUseCaseImpl usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp((){
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTriviaUseCaseImpl(mockNumberTriviaRepository);
  });

  const tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: "Dummy Text", number: 1);

  test('should get trivia from the number from the repository', () async{
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
    .thenAnswer((_) async => DataResponse(numberTrivia: tNumberTrivia, failures: null));
    final result = await usecase(tNumber);
    expect(result.numberTrivia.number, DataResponse(numberTrivia: tNumberTrivia, failures: null).numberTrivia.number);
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}