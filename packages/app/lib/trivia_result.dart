import 'package:flutter/material.dart';

class TriviaResult extends StatelessWidget {
  final String text;

  const TriviaResult({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: <Widget>[
          const Text(
            "Anecdote : ",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}