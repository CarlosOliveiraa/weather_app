import 'package:flutter/material.dart';

import '../../../domain/entities/weather_forecast.dart';

class WeatherCard extends StatelessWidget {
  final double width;
  final double height;
  // final String? day;
  // final String? temperature;
  // final String? wind;
  final WeatherForecast? result;

  const WeatherCard({
    Key? key,
    this.width = 200,
    this.height = 100,
    this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.blueAccent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Day: ${result!.day}"),
            Text("Temperature: ${result!.temperature}"),
            Text("Wind: ${result!.wind}"),
          ],
        ));
  }
}
