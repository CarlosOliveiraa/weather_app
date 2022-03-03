import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/module/weather/presenters/blocs/weather_events.dart';
import 'package:weather_app/app/module/weather/presenters/blocs/weather_states.dart';

import '../../domain/usecases/weather_by_text.dart';

class WeatherBloc extends Bloc<WeatherEvents, WeatherStates> {
  final IWeatherByText usecase;

  WeatherBloc(this.usecase) : super(WeatherStart()){
    on<WeatherSearchEvent>(getWeather);
  }

  getWeather(WeatherSearchEvent event, Emitter<WeatherStates> emit) async {
    emit(WeatherLoad());
    final result = await usecase(event.weatherText);
    emit(result.fold((l) => WeatherError(l), (r) => WeatherSuccess(r)));
  }
}
