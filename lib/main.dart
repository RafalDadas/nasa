import 'package:flutter/material.dart';

import 'apod_repository.dart';
import 'app.dart';

void main() {
  runApp(App(
    apodRepository: APODRepository(),
  ));
}
