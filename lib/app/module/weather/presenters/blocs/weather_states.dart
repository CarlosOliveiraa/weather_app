import '../../domain/entities/weather_search.dart';
import '../../domain/errors/weather_errors.dart';

abstract class WeatherStates{}


class WeatherLoad implements WeatherStates{}

class WeatherSuccess implements WeatherStates{
  final WeatherSearch weather;

  WeatherSuccess(this.weather);
}

class WeatherError implements WeatherStates{
  final WeatherErrors message;

  WeatherError(this.message);
}

class WeatherStart implements WeatherStates{}