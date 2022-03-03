abstract class WeatherEvents {}


class WeatherSearchEvent extends WeatherEvents{
  final String weatherText;

  WeatherSearchEvent(this.weatherText);
}
