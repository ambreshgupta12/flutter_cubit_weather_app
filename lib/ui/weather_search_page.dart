import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_weather_app/cubit/weather_cubit.dart';
import 'package:flutter_cubit_weather_app/cubit/weather_state.dart';
import 'package:flutter_cubit_weather_app/model/weather_response.dart';

class WeatherSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather Search'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 16),

          child: BlocConsumer<WeatherCubit, WeatherState>(
              listener: (context, state) {
            if (state is WeatherErrorState) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('${state.errorMessage}')));
            }
          }, builder: (context, state) {
            if (state is WeatherInitialState) {
              return buildInitialInput();
            } else if (state is WeatherLoadingState) {
              return buildLoading();
            } else if (state is WeatherLoaded) {
             return buildColumnWithData(state.weatherResponse);
            } else {
              // (state is WeatherError)
              return buildInitialInput();
            }
          }),
        ));
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildColumnWithData(WeatherResponse weatherResponse) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly
      ,
      children: <Widget>[
        Text(
          "${weatherResponse.cityName}",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
        ),
        Text(
          "${weatherResponse.temperatureCelsius.toStringAsFixed(1)} °C",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
        ),
        buildInitialInput()
      ],
    );
  }
}

class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        onFieldSubmitted: (value) => submitCityName(context, value),
        decoration: InputDecoration(
            hintText: 'Enter a city',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: Icon(Icons.search)),
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName) {
    context.bloc<WeatherCubit>().getWeather(cityName);
  }
}
