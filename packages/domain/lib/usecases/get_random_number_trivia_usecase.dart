import 'package:domain/models/data_response.dart';

abstract class GetRandomNumberTriviaUseCase{
  Future<DataResponse> call();
}