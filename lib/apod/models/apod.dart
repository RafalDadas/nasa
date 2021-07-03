import 'package:equatable/equatable.dart';

class APOD extends Equatable {
  const APOD({
    required this.title,
    this.copyright,
    required this.date,
    required this.explanation,
    required this.url,
    this.hdUrl,
    required this.mediaType,
  });

  final String title;
  final String? copyright;
  final String date;
  final String explanation;
  final String url;
  final String? hdUrl;
  final String mediaType;

  @override
  List<Object?> get props => [
        title,
        copyright,
        date,
        explanation,
        url,
        hdUrl,
        mediaType,
      ];
}
