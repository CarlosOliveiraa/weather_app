import 'package:dartz/dartz.dart';

import '../entities/weather_search.dart';
import '../errors/weather_errors.dart';
import '../repositories/weather_repository.dart';

abstract class IWeatherByText {
  Future<Either<WeatherErrors, WeatherSearch>> call(String weatherText);
}

class WeatherByText implements IWeatherByText {
  final IWeatherRepository repository;

  WeatherByText(this.repository);

  @override
  Future<Either<WeatherErrors, WeatherSearch>> call(String weatherText) async {
    if (weatherText.isEmpty) {
      return Left(InvalidTextError());
    }
    return repository.weatherSearch(weatherText);
  }
}
