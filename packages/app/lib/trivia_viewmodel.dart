import 'package:domain/models/data_response.dart';
import 'package:domain/models/number_trivia.dart';
import 'package:domain/usecases/get_concrete_number_trivia_usecase.dart';
import 'package:domain/usecases/get_random_number_trivia_usecase.dart';
import 'package:mobx/mobx.dart';
part 'trivia_viewmodel.g.dart';

class TriviaViewModel = _TriviaViewModel with _$TriviaViewModel;

abstract class _TriviaViewModel with Store {

  final GetRandomNumberTriviaUseCase useCaseRandom;
  final GetConcreteNumberTriviaUseCase useCaseConcrete;
  _TriviaViewModel(this.useCaseRandom, this.useCaseConcrete);

  @observable
  DataResponse data = DataResponse(numberTrivia: NumberTrivia(number: 1,text: ""), failures: null);

  @action
  Future<dynamic> random() async {
    DataResponse newData = await useCaseRandom.call();
    data = newData;
  }

  @action
  Future<dynamic> getNumber(int number) async {
    DataResponse newData = await useCaseConcrete.call(number);
    data = newData;
  }
}