import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/app/module/weather/1%20-%20domain/entities/weather_search.dart';
import 'package:weather_app/app/module/weather/1%20-%20domain/errors/weather_errors.dart';
import 'package:weather_app/app/module/weather/2%20-%20infra/datasource/weather_datasource.dart';
import 'package:weather_app/app/module/weather/2%20-%20infra/models/weather_search_model.dart';
import 'package:weather_app/app/module/weather/2%20-%20infra/repository/weahter_repository_impl.dart';

class WeatherDatasourceMock extends Mock implements WeatherDatasource {}

void main() {
  final datasource = WeatherDatasourceMock();
  final repository = WeatherRepositoryImpl(datasource);

  final weahter = WeatherSearchModel(
    temperature: "123",
    wind: "123",
    description: "123",
    forecast: [],
    day: "123",
  );

  test('Deve retornar um WeatherSearchModel', () async {
    when(() => datasource.getWeather(any())).thenAnswer((_) async => weahter);
    final result = await repository.weatherSearch("Curitiba");
    expect(result.fold(id, id), isA<WeatherSearch>());
  });
  test('Deve retornar um Erro', () async {
    when(() => datasource.getWeather(any())).thenThrow(Exception());
    final result = await repository.weatherSearch("Curitiba");
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
