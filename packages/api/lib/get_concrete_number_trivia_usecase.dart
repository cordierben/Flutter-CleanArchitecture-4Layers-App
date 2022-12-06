import 'models/data_response.dart';

abstract class GetConcreteNumberTriviaUseCase{
  Future<DataResponse> call(int number);
}