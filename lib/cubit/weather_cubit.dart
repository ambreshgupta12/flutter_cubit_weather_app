
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_weather_app/cubit/weather_state.dart';
import 'package:flutter_cubit_weather_app/repository/weather_repository.dart';

class WeatherCubit extends Cubit<WeatherState>{
  final WeatherRepository _weatherRepository;
  WeatherCubit(this._weatherRepository) : super(WeatherInitialState());

  Future<void>  getWeather(String cityName)async{
   try{
     emit(WeatherLoadingState());
     final  weather= await _weatherRepository.fetchWeather(cityName);
     emit(WeatherLoaded(weather));
   } on NetworkException{
     emit(WeatherErrorState("Couldn't fetch weather. Is the device online?"));
   }
  }
}