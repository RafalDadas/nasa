import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../apod.dart';
import '../../apod_repository.dart';

class APODPage extends StatelessWidget {
  const APODPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => APODBloc(
        apodRepository: context.read<APODRepository>(),
      )..add(APODLoaded()),
      child: APODPageBody(),
    );
  }
}

class APODPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<APODBloc>().state;
    switch (state.status) {
      case APODStatus.failure:
        // TODO: Check if user has internet connection
        // TODO: Failure in getting APOD should prompt user to change date
        return const Center(child: Text('Getting a picture of the day failed'));
      case APODStatus.success:
        return APODView(apod: state.apod);
      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }
}

class APODView extends StatelessWidget {
  const APODView({Key? key, required this.apod}) : super(key: key);

  final APOD apod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Container(
            color: Colors.black,
            height: 48.0,
            child: Center(
              child: Text(
                'Picture date: ${apod.date}',
              ),
            ),
          ),
        ),
        leading: Image(image: AssetImage('assets/nasa_logo.png')),
        centerTitle: true,
        title: Text('A Picture of the Day'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Change date',
            icon: Icon(Icons.calendar_today),
            onPressed: () async {
              DateTime initialDate = DateTime.parse(apod.date);
              print('Calendar IconButton pressed');
              DateTime selectedDate = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DatePickerDialog(
                        initialDate: initialDate,
                        // Date must be between Jun 16, 1995 and today.
                        firstDate: DateTime(1995, 6, 16),
                        lastDate: DateTime.now(),
                      );
                    },
                  ) ??
                  DateTime.parse(apod.date);
              print('Selected date: $selectedDate');
              if (initialDate != selectedDate) {
                context.read<APODBloc>().add(APODNewDateSelected(selectedDate));
              }
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          apod.mediaType == 'image'
              ? Image.network(apod.url)
              : Center(
                  child: Text(
                    'Probably this is a video or other unsupported format. For now only images are supported.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
          Center(
            child: Text(
              apod.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          Text(apod.explanation),
          apod.hdUrl != null
              ? RichText(
                  text: TextSpan(
                    text: 'Link to HD image: ',
                    children: <TextSpan>[
                      TextSpan(
                        text: apod.hdUrl,
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            final url = apod.hdUrl;
                            if (await canLaunch(url!)) {
                              await launch(url);
                            }
                          },
                      ),
                    ],
                  ),
                )
              : Text(''),
        ],
      ),
    );
  }
}
