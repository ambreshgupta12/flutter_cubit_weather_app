import 'dart:math';

import 'package:flutter_cubit_weather_app/model/weather_response.dart';

abstract class WeatherRepository {
  Future<WeatherResponse> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  @override
  Future<WeatherResponse> fetchWeather(String cityName) {
    // Simulate network delay
    return Future.delayed(Duration(seconds: 1), () {
      final random = Random();
      // Simulate some network exception
      if (random.nextBool()) {
        throw NetworkException();
      }
      return WeatherResponse(
          cityName: cityName,
          temperatureCelsius: 20 + random.nextInt(15) + random.nextDouble());
    });
  }
}

class NetworkException implements Exception {}
