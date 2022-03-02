import 'package:dartz/dartz.dart';

import '../entities/weather_search.dart';
import '../errors/weather_errors.dart';

abstract class IWeatherRepository {
  Future<Either<WeatherErrors, WeatherSearch>> weatherSearch(
      String weatherText);
}
