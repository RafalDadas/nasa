part of 'apod_bloc.dart';

enum APODStatus { loading, failure, success }

class APODState extends Equatable {
  const APODState._({
    this.status = APODStatus.loading,
    this.apod = const APOD(
      title: '',
      copyright: '',
      date: '',
      explanation: '',
      url: '',
      hdUrl: '',
      mediaType: '',
    ),
  });

  final APODStatus status;
  final APOD apod;

  const APODState.loading() : this._();

  const APODState.failure() : this._(status: APODStatus.failure);

  const APODState.success(APOD apod)
      : this._(
          status: APODStatus.success,
          apod: apod,
        );

  @override
  List<Object> get props => [status];
}
