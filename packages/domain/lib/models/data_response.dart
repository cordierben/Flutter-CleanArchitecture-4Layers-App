import 'package:domain/models/failures.dart';
import 'package:domain/models/number_trivia.dart';

class DataResponse{
  NumberTrivia numberTrivia = NumberTrivia(text: "none", number: -1);
  Failure? failures;

  DataResponse({
    required this.numberTrivia,
    required this.failures
  });
}