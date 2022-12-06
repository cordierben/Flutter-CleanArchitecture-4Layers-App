import 'dart:convert';
import 'package:data/models/number_trivia_model.dart';
import 'package:domain/models/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import '../utils/json_reader.dart';

void main(){
  final tNumberTriviaModel = NumberTriviaModel(text: "text", number: 42);

  test('should be a subclass of Number Trivia',() async{
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('from JSON',(){
    test(
      'should return valid model when json number is an integer',() async{
        final Map<String, dynamic> jsonMap = jsonDecode(fixture('trivia.json'));
        final result = NumberTriviaModel.fromJson(jsonMap);
        expect(result.number, tNumberTriviaModel.number);
      }
    );
    test(
      'should return valid model when json number is a double',() async{
        final Map<String, dynamic> jsonMap = jsonDecode(fixture('trivia_double.json'));
        final result = NumberTriviaModel.fromJson(jsonMap);
        expect(result.number, tNumberTriviaModel.number);
      }
    );
  });

  group('to JSON',(){
    test(
      'should return a JSON map containing the proper data',() async{
        final result = tNumberTriviaModel.toJson();
        final expected = {
          "text": "text",
          "number": 42,
      };
      expect(result, expected);
      }
    );
  });
}