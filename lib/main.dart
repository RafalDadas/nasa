import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'apod_repository.dart';
import 'app.dart';
import 'nasa_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = NasaBlocObserver();
  runApp(App(apodRepository: APODRepository()));
}
