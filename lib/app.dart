import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'apod/apod.dart';
import 'apod_repository.dart';

class App extends MaterialApp {
  App({required APODRepository apodRepository})
      : super(
          debugShowCheckedModeBanner: false,
          home: RepositoryProvider.value(
            value: apodRepository,
            child: const APODPage(),
          ),
          theme: ThemeData.dark(),
        );
}
