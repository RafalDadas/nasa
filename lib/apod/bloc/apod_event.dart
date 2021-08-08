part of 'apod_bloc.dart';

abstract class APODEvent extends Equatable {
  const APODEvent();

  @override
  List<Object> get props => [];
}

class APODLoaded extends APODEvent {}

class APODNewDateSelected extends APODEvent {
  const APODNewDateSelected(this.date);

  final DateTime date;

  @override
  List<Object> get props => [date];
}
