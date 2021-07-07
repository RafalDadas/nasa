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
          apodRepository.getPictureOfTheDay(date: DateTime.utc(2020, 1, 2)),
          completion(equals(APOD(
            title: 'The Fainting of Betelgeuse',
            copyright: 'Jimmy Westlake',
            date: '2020-01-02',
            explanation: "Begirt with many a blazing star, Orion the Hunter is one of the most recognizable constellations. In this night skyscape the Hunter's stars rise in the northern hemisphere's winter sky on December 30, 2019, tangled in bare trees near Newnan, Georgia, USA. Red supergiant star Betelgeuse stands out in yellowish hues at Orion's shoulder left of center, but it no longer so strongly rivals the blue supergiant star Rigel at the Hunter's foot. In fact, skygazers around planet Earth can see a strikingly fainter Betelgeuse now, its brightness fading by more than half in the final months of 2019. Betelgeuse has long been known to be a variable star, changing its brightness in multiple cycles with approximate short and long term periods of hundreds of days to many years. The star is now close to its faintest since photometric measurements in 1926/27, likely due in part to a near coincidence in the minimum of short and long term cycles. Betelgeuse is also recognized as a nearby red supergiant star that will end its life in a core collapse supernova explosion sometime in the next 100,000 years, though that cosmic cataclysm will take place a safe 700 light-years or so from our fair planet.",
            url: 'https://apod.nasa.gov/apod/image/2001/OrionTrees123019Westlake1024.jpg',
            hdUrl: 'https://apod.nasa.gov/apod/image/2001/OrionTrees123019Westlake.jpg',
            mediaType: 'image',
          ))),
        );
      });
    });
  });
}
