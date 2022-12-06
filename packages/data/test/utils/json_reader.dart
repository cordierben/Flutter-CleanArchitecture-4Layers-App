import 'dart:io';

String fixture(String name) => File('test/utils/$name').readAsStringSync();