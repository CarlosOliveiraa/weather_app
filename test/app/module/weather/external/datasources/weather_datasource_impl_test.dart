import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/app/module/weather/domain/errors/weather_errors.dart';
import 'package:weather_app/app/module/weather/external/datasources/weather_datasource_impl.dart';
import 'package:weather_app/app/module/weather/utils/weather_return.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = WeatherDataSourceImpl(dio);

  test('Deve retornar uma lista em caso de sucesso', () {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        data: jsonDecode(weatherReturn),
        statusCode: 200,
        requestOptions: RequestOptions(path: "")));
    final future = datasource.getWeather("weatherText");
    expect(future, completes);
  });
  test('Deve retornar um erro em caso de falha do dio', () {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          data: null,
          statusCode: 401,
          requestOptions: RequestOptions(path: ""),
        ));
    final future = datasource.getWeather("weatherText");
    expect(future, throwsA(isA<DatasourceError>()));
  });
}
