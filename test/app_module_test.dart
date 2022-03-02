import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:weather_app/app/module/weather/domain/entities/weather_search.dart';
import 'package:weather_app/app/module/weather/domain/usecases/weather_by_text.dart';
import 'package:weather_app/app/module/weather/utils/weather_return.dart';
import 'package:weather_app/app_module.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  initModule(AppModule(), replaceBinds: [
    Bind<Dio>((i) => dio),
  ]);

  test('Deve retornar o usecase sem erro', () {
    final usecase = Modular.get<IWeatherByText>();
    expect(usecase, isA<WeatherByText>());
  });
  test('Deve retornar WeatherSearch', () async {
    when(() => dio.get(any())).thenAnswer(
      (_) async => Response(
        data: jsonDecode(weatherReturn),
        statusCode: 200,
        requestOptions: RequestOptions(path: ""),
      ),
    );
    final usecase = Modular.get<IWeatherByText>();
    final result = await usecase("Carlos");

    expect(result.fold((l) => l, (r) => r), isA<WeatherSearch>());
  });
}
