import 'package:dio/dio.dart';
import 'package:weather_app/app/module/weather/infra/models/weather_search_model.dart';

import '../../domain/errors/weather_errors.dart';
import '../../infra/datasource/weather_datasource.dart';

class WeatherDataSourceImpl implements WeatherDatasource {
  final Dio dio;

  WeatherDataSourceImpl(this.dio);

  @override
  Future<WeatherSearchModel> getWeather(String weatherText) async {
    final response =
        await dio.get("https://goweather.herokuapp.com/weather/$weatherText");

    if (response.statusCode == 200) {
      return WeatherSearchModel.fromMap(response.data);
    } else {
      throw DatasourceError();
    }
  }
}
