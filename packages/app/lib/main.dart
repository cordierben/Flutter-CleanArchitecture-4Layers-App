import 'package:app/injection_container.dart';
import 'package:app/trivia_viewmodel.dart';
import 'package:domain/usecases/get_concrete_number_trivia_usecase.dart';
import 'package:domain/usecases/get_random_number_trivia_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


final triviaViewModel = TriviaViewModel(
    locator<GetRandomNumberTriviaUseCase>(),
    locator<GetConcreteNumberTriviaUseCase>()
);

class TriviaView extends StatefulWidget {
  const TriviaView({super.key});

  @override
  State<TriviaView> createState() => _TriviaViewState();
}

class _TriviaViewState extends State<TriviaView> {
  String buttonName = "Click";
  int bottomNavIndex = 0;
  bool isClicked = false;

  final controller = TextEditingController();
  String inputStr = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Input a number',
              ),
              onChanged: (value) {
                inputStr = value;
              },
              onSubmitted: (_) {
                dispatchConcrete();
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: dispatchConcrete,
                    child: const Text('Search'),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const Text('The number is:',),
            // Wrapping in the Observer will automatically re-render on changes to counter.value
            Observer(
              builder: (_) => Text(
                    '${triviaViewModel.data.numberTrivia.number}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
            ),
            Observer(
              builder: (_) => Text(
                    'Anecdote : ${triviaViewModel.data.numberTrivia.text}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: triviaViewModel.random,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void dispatchConcrete() {
    controller.clear();
    triviaViewModel.getNumber(int.parse(inputStr));
  }

}

