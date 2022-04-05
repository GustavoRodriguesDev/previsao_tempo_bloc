import 'package:previsao_tempo_bloc/core/domain/entities/weather_entity.dart';

abstract class ForecastState {}

class SuccessForecastState implements ForecastState {
  final WeatherEntity forecast;

  SuccessForecastState({this.forecast = const WeatherEntity(description: '', forecast: [], temperature: '', wind: '')});
  String get decription => forecast.description;
  String get wind => forecast.wind;
  String get temperature => forecast.temperature;
  List get forecastList => forecast.forecast;

  String selectImage() {
    if (forecast.description == 'Light rain') {
      return 'assets/climate/Light_rain_shower.png';
    } else if (forecast.description == 'Light rain shower' || forecast.description == 'Light drizzle') {
      return 'assets/climate/Light_rain_shower.png';
    } else if (forecast.description == 'Sunny' || forecast.description == 'Clear') {
      return 'assets/climate/sunny.png';
    } else if (forecast.description == 'Partly cloudy') {
      return 'assets/climate/partly_cloudy.png';
    } else if (forecast.description == 'Patchy rain possible') {
      return 'assets/climate/patchy_rain_possible_climate.png';
    } else if (forecast.description == 'Rain' || forecast.description == 'Moderate rain') {
      return 'assets/climate/rain.png';
    }
    return '';
  }
}

class LoadingForecastState implements ForecastState {}

class ErrorForecastState implements ForecastState {
  final error;

  ErrorForecastState(this.error);
}

class EmptyState implements ForecastState {}
