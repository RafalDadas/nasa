import 'dart:convert';

import 'package:http/http.dart' as http;

import 'apod/apod.dart';

/// Repository containing methods for A Picture of the Day from NASA APIs
class APODRepository {
  /// Used to fetch NASA Picture of the Day from NASA APIs. Defaults to today's
  /// picture or video. Optionally you can specify other date.
  Future<APOD> getPictureOfTheDay({DateTime? date}) async {
    http.Response response;

    response = await http.get(
      // Checks if user specified exact date.
      // https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2020-01-02
      date != null
          ? Uri.parse(
              'https://api.nasa.gov/planetary/apod'
              '?api_key=DEMO_KEY'
              '&date=${date.year}-${date.month}-${date.day}',
            )
          : Uri.parse(
              'https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY',
            ),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print('getPictureOfTheDay method status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      return APOD(
        title: body['title'],
        copyright: body['copyright'],
        date: body['date'],
        explanation: body['explanation'],
        url: body['url'],
        hdUrl: body['hdurl'],
        mediaType: body['media_type'],
      );
    }

    throw Exception('Error getting Picture of the Day');
  }
}
