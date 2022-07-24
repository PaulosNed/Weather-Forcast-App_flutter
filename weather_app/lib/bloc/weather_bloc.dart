import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/data_provider/remote_provider.dart';
import 'package:weather_app/models/Weather.dart';

final RemoteProvider weatherProvider = RemoteProvider();

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(Idle()) {
    on<Search>(searchHandler);
  }
}

searchHandler(Search event, Emitter emit) async {
  emit(Loading());
  try {
    final WeatherForecast weatherForecast =
        await weatherProvider.get(event.cityName);
    emit(Loaded(weatherForecast));
  } catch (Exceptions) {
    emit(LoadingFailed(event.cityName));
  }
}
