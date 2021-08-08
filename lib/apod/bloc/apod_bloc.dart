import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../apod.dart';
import '../../apod_repository.dart';

part 'apod_event.dart';

part 'apod_state.dart';

class APODBloc extends Bloc<APODEvent, APODState> {
  APODBloc({required this.apodRepository}) : super(const APODState.loading());

  final APODRepository apodRepository;

  @override
  Stream<APODState> mapEventToState(APODEvent event) async* {
    if (event is APODLoaded) {
      yield* _mapAPODLoadedToState();
    } else if (event is APODNewDateSelected) {
      yield* _mapAPODNewDateSelectedToState(event);
    }
  }

  Stream<APODState> _mapAPODLoadedToState() async* {
    yield APODState.loading();
    try {
      final APOD apod = await this.apodRepository.getPictureOfTheDay();
      yield APODState.success(apod);
    } catch (error) {
      yield APODState.failure();
    }
  }

  Stream<APODState> _mapAPODNewDateSelectedToState(
      APODNewDateSelected event) async* {
    yield APODState.loading();
    try {
      final APOD apod = await this.apodRepository.getPictureOfTheDay(
            date: event.date,
          );
      yield APODState.success(apod);
    } catch (error) {
      yield APODState.failure();
    }
  }
}
