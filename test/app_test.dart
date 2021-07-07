import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa/apod_repository.dart';
import 'package:nasa/app.dart';
import 'package:mocktail/mocktail.dart';

class MockAPODRepository extends Mock implements APODRepository {}

void main() {
  late APODRepository apodRepository = MockAPODRepository();

  setUp(() {
    apodRepository = MockAPODRepository();
  });

  group('App', () {
    testWidgets('is a MaterialApp', (tester) async {
      expect(
        App(apodRepository: apodRepository),
        isA<MaterialApp>(),
      );
    });
  });
}
