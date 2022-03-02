import 'package:dartz/dartz.dart';

import '../../domain/entities/weather_search.dart';
import '../../domain/errors/weather_errors.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasource/weather_datasource.dart';

class WeatherRepositoryImpl implements IWeatherRepository {
  final WeatherDatasource datasource;

  WeatherRepositoryImpl(this.datasource);

  @override
  Future<Either<WeatherErrors, WeatherSearch>> weatherSearch(
      String weatherText) async {
    try {
      final result = await datasource.getWeather(weatherText);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
