abstract class WeatherErrors implements Exception {}

class InvalidTextError implements WeatherErrors {}

class DatasourceError implements WeatherErrors {
  final String? message;

  DatasourceError({this.message});
}
