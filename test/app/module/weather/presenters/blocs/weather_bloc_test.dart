import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/app/module/weather/domain/entities/weather_search.dart';
import 'package:weather_app/app/module/weather/domain/errors/weather_errors.dart';
import 'package:weather_app/app/module/weather/domain/usecases/weather_by_text.dart';
import 'package:weather_app/app/module/weather/presenters/blocs/weather_bloc.dart';
import 'package:weather_app/app/module/weather/presenters/blocs/weather_events.dart';
import 'package:weather_app/app/module/weather/presenters/blocs/weather_states.dart';

class WeatherByTextMock extends Mock implements WeatherByText {}

void main() {
  final usecase = WeatherByTextMock();

  final weatherResult = WeatherSearch(
      temperature: "123",
      wind: "123",
      description: "123",
      forecast: [],
      day: "123");

  blocTest<WeatherBloc, WeatherStates>("Deve retornar os estados em ordem",
      build: () {
        when(() => usecase.call(any()))
            .thenAnswer((_) async => Right(weatherResult));
        return WeatherBloc(usecase);
      },
      act: (bloc) => bloc.add(WeatherSearchEvent("carlos")),
      expect: () => [
            isA<WeatherLoad>(),
            isA<WeatherSuccess>(),
          ]);
  blocTest<WeatherBloc, WeatherStates>("Deve retornar um erro",
      build: () {
        when(() => usecase.call(any()))
            .thenAnswer((_) async => Left(InvalidTextError()));
        return WeatherBloc(usecase);
      },
      act: (bloc) => bloc.add(WeatherSearchEvent("carlos")),
      expect: () => [
            isA<WeatherLoad>(),
            isA<WeatherError>(),
          ]);
}
