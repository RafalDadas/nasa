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
      date != null
          ? Uri.parse(
              'https://https://api.nasa.gov/planetary/apod'
              '?api_key=DEMO_KEY'
              '&date=${date.year.toString}-${date.month.toString}-${date.day.toString()}',
            )
          : Uri.parse(
              'https://https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY',
            ),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print('getPictureOfTheDay method status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final APOD body = json.decode(response.body) as APOD;
      return APOD(
        title: body.title,
        copyright: body.copyright,
        date: body.date,
        explanation: body.explanation,
        url: body.url,
        hdUrl: body.hdUrl,
        mediaType: body.mediaType,
      );
    }

    throw Exception('Error getting Picture of the Day');
  }
}
