import 'package:flutter_test/flutter_test.dart';
import 'package:nasa/apod_repository.dart';
import 'package:nasa/apod/apod.dart';

void main() {
  group('APOD Repository', () {
    late APODRepository apodRepository;

    setUp(() {
      apodRepository = APODRepository();
    });

    group('getPictureOfTheDay', () {
      test('Returns a picture of the day', () {
        expect(
          apodRepository.getPictureOfTheDay(),
          completion(equals(APOD(
            title: '',
            copyright: '',
            date: '',
            explanation: '',
            url: '',
            hdUrl: '',
            mediaType: '',
          ))),
        );
      });
    });
  });
}
