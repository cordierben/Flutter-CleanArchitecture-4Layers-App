// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trivia_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TriviaViewModel on _TriviaViewModel, Store {
  late final _$dataAtom = Atom(name: '_TriviaViewModel.data', context: context);

  @override
  DataResponse get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(DataResponse value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$randomAsyncAction =
      AsyncAction('_TriviaViewModel.random', context: context);

  @override
  Future random() {
    return _$randomAsyncAction.run(() => super.random());
  }

  late final _$getNumberAsyncAction =
      AsyncAction('_TriviaViewModel.getNumber', context: context);

  @override
  Future getNumber(int number) {
    return _$getNumberAsyncAction.run(() => super.getNumber(number));
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
