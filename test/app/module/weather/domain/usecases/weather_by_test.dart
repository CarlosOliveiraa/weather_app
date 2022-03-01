import 'package:dartz/dartz.dart';

import '../entities/weather_search.dart';

abstract class IWeatherByText {
  Future<Either<Exception, WeatherSearch>> call(String weatherText);
}

class WeatherByText implements IWeatherByText {
  @override
  Future<Either<Exception, WeatherSearch>> call(String weatherText) {
    throw UnimplementedError();
  }
}
