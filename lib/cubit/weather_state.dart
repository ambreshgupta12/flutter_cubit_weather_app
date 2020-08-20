import 'package:flutter_cubit_weather_app/model/weather_response.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

// intitial state of weather
class WeatherInitialState extends WeatherState {
  const WeatherInitialState();
}

// Loading  state of weather(show Loader in UI)
class WeatherLoadingState extends WeatherState {
  const WeatherLoadingState();
}

// Loaded  state of weather(show The Weather Result on UI )
class WeatherLoaded extends WeatherState {
  final WeatherResponse weatherResponse;

  WeatherLoaded(this.weatherResponse);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is WeatherLoaded && o.weatherResponse == weatherResponse;
  }

  @override
  int get hashCode => weatherResponse.hashCode;
}

// Error  state of weather(show the error on UI)
class WeatherErrorState extends WeatherState {
  final String errorMessage;

  WeatherErrorState(this.errorMessage);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is WeatherErrorState && o.errorMessage == errorMessage;
  }

  @override
  int get hashCode => errorMessage.hashCode;
}
