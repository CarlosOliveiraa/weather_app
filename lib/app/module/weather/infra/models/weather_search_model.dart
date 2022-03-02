import 'dart:convert';

import '../../domain/entities/weather_forecast.dart';
import '../../domain/entities/weather_search.dart';

class WeatherSearchModel extends WeatherSearch {
  // ignore: annotate_overrides, overridden_fields
  set temperature(String value) => temperature = value;
  set wind(String value) => wind = value;
  set description(String value) => description = value;
  set forecast(List value) => forecast = value;
  set day(String value) => temperature = value;

  WeatherSearchModel(
      {required String temperature,
      required String wind,
      required String description,
      required List<WeatherForecast> forecast,
      required String day})
      : super(
            temperature: temperature,
            wind: wind,
            description: description,
            forecast: forecast,
            day: day);

  Map<String, dynamic> toMap() {
    return {
      'temperature': temperature,
      'wind': wind,
      'description': description,
      'forecast': forecast,
      'day': day,
    };
  }

  factory WeatherSearchModel.fromMap(Map map) {
    return WeatherSearchModel(
      temperature: map['temperature'] ?? '',
      wind: map['wind'] ?? '',
      description: map['description'] ?? '',
      forecast: map['forecast'] == null
          ? []
          : List<WeatherForecast>.from(map['forecast'].map((e) =>
              WeatherForecast(
                  day: e['day'],
                  temperature: e['temperature'],
                  wind: e['wind']))),
      day: map['day'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherSearchModel.fromJson(String source) =>
      WeatherSearchModel.fromMap(json.decode(source));
}
