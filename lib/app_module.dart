import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/module/weather/domain/usecases/weather_by_text.dart';
import 'app/module/weather/external/datasources/weather_datasource_impl.dart';
import 'app/module/weather/infra/repository/weahter_repository_impl.dart';
import 'app/module/weather/presenters/blocs/weather_bloc.dart';
import 'app_widget.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => Dio()),
        Bind((i) => WeatherDataSourceImpl(i())),
        Bind((i) => WeatherRepositoryImpl(i())),
        Bind((i) => WeatherByText(i())),
        Bind((i) => WeatherBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [];

  Widget get bootstrap => const AppWidget();
}
