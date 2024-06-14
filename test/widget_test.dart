// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_default_project/data/remote/repositories/user_repository.dart';
import 'package:flutter_default_project/settings/injection.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_default_project/main.dart';
import 'package:injectable/injectable.dart' as env;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(env.Environment.dev);

  group('User Repository', () {
    final userRepository = getIt<UserRepository>();
    test('Fetch users', () async {
      try{
      final users = await userRepository.getUser();
      expect(users, true);
      } catch(e) {
        assert(e is Exception);
      }
    });
  });
}
