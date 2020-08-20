import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_weather_app/repository/weather_repository.dart';
import 'package:flutter_cubit_weather_app/ui/weather_search_page.dart';

import 'cubit/weather_cubit.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
           create: (context)=>WeatherCubit(FakeWeatherRepository()),
          child: WeatherSearchPage()),
    );
  }
}

