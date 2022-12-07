import 'package:api/injection_container.dart';
import 'package:app/trivia_result.dart';
import 'package:app/trivia_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:api/get_concrete_number_trivia_usecase.dart';
import 'package:api/get_random_number_trivia_usecase.dart';

final triviaViewModel = TriviaViewModel(locator<GetRandomNumberTriviaUseCase>(),
    locator<GetConcreteNumberTriviaUseCase>());

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
      resizeToAvoidBottomInset: false, // set it to false
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 70.0, left: 50.0, right: 50.0),
            child: TextField(
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
          ),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: ElevatedButton(
                onPressed: dispatchConcrete,
                child: const Text('Search'),
              )),
          // Wrapping in the Observer will automatically re-render on changes to counter.value
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text('The number is:',
                        style: TextStyle(fontSize: 25, color: Colors.white))),
                Observer(
                  builder: (_) => Text(
                      '${triviaViewModel.data.numberTrivia.number}',
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                Observer(
                    builder: (_) => TriviaResult(
                        text: triviaViewModel.data.numberTrivia.text)),
              ],
            ),
          ))
        ],
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
