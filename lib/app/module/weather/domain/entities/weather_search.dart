import 'weather_forecast.dart';

class WeatherSearch {
  final String temperature;
  final String wind;
  final String description;
  final List<WeatherForecast> forecast;
  final String day;

  WeatherSearch({
    required this.temperature,
    required this.wind,
    required this.description,
    required this.forecast,
    required this.day,
  });
}
