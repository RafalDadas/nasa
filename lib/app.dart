import 'package:flutter/material.dart';

import 'apod_repository.dart';

class App extends MaterialApp {
  App({required APODRepository apodRepository}) : super(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Nasa'),
      ),
    ),
  );
}
