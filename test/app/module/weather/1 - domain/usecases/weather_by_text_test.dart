import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/app/module/weather/1%20-%20domain/entities/weather_search.dart';
import 'package:weather_app/app/module/weather/1%20-%20domain/errors/weather_errors.dart';
import 'package:weather_app/app/module/weather/1%20-%20domain/repositories/weather_repository.dart';
import 'package:weather_app/app/module/weather/1%20-%20domain/usecases/weather_by_text.dart';


class IWeatherRepositoryMock extends Mock implements IWeatherRepository {}

void main() {
  final repository = IWeatherRepositoryMock();
  final usecase = WeatherByText(repository);
  final weatherResult = WeatherSearch(
      temperature: "123",
      wind: "123",
      description: "123",
      forecast: [],
      day: "123");

  test('Deve retornar WeatherSearch', () async {
    when(() => repository.weatherSearch(any()))
        .thenAnswer((_) async => Right(weatherResult));
    final result = await usecase("Curitiba");
    expect(result.fold(id, id), isA<WeatherSearch>());
  });
  test('Deve retornar  InvalidError', () async {
    when(() => repository.weatherSearch(any()))
        .thenAnswer((_) async => Right(weatherResult));
    var result = await usecase("");
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}