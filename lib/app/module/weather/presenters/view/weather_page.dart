import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/app/module/weather/presenters/blocs/weather_bloc.dart';
import 'package:weather_app/app/module/weather/presenters/blocs/weather_events.dart';
import 'package:weather_app/app/module/weather/presenters/blocs/weather_states.dart';
import 'package:weather_app/app/module/weather/presenters/view/components/custom_textformfield.dart';
import 'package:weather_app/app/module/weather/presenters/view/components/weahter_card.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final bloc = Modular.get<WeatherBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? _weatherText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Search"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomTextField(
            onChanged: (value) {
              _weatherText = value;
            },
            onTap: () {
              bloc.add(WeatherSearchEvent(_weatherText!));
            },
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<WeatherBloc, WeatherStates>(
            bloc: bloc,
            builder: (context, state) {
              if (state is WeatherStart) {
                return const Center(
                  child: Text("Nenhuma informação"),
                );
              }
              if (state is WeatherLoad) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is WeatherError) {
                return const Center(
                  child: Text("Houve um erro"),
                );
              }
              final result = (state as WeatherSuccess).weather;
              return Container(
                padding: const EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height * 0.70,
                child: Column(
                  children: [
                    Text("Temperature: ${result.temperature}"),
                    Text("Wind: ${result.wind}"),
                    Text("Description: ${result.description}"),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: result.forecast.length,
                      itemBuilder: (context, index) {
                        return WeatherCard(
                          width: MediaQuery.of(context).size.width * 0.1,
                          result: result.forecast[index],
                        );
                      },
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
