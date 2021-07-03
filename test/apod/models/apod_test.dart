import 'package:flutter_test/flutter_test.dart';
import 'package:nasa/apod/apod.dart';

void main() {
  group('APOD', () {
    const mockAPOD = APOD(
      title: 'title',
      copyright: 'copyright',
      date: 'date',
      explanation: 'explanation',
      url: 'url',
      hdUrl: 'hdUrl',
      mediaType: 'mediaType',
    );
    test('Support value comparisons', () {
      expect(mockAPOD, mockAPOD);
    });
  });
}
