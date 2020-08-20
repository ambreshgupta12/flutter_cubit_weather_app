import 'package:meta/meta.dart';
class WeatherResponse{
final String cityName;
final double temperatureCelsius;

WeatherResponse({@required this.cityName, @required this.temperatureCelsius});

  @override
  int get hashCode {
//
  }

  @override
  bool operator ==(other) {
//
  }
}