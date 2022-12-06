import 'package:api/models/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia{

  NumberTriviaModel({
    required String text,
    required int number
  }) : super(text: text,number: number);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json){
    return NumberTriviaModel(
      text: json['text'],
      number: int.parse(json['number'])
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'text' : text,
      'number' : number
    };
  }
}