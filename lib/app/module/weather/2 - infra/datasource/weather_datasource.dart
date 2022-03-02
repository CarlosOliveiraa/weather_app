import '../models/weather_search_model.dart';

abstract class WeatherDatasource {
  Future<WeatherSearchModel> getWeather(String weatherText);
}
