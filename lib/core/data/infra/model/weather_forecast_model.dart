import 'package:previsao_tempo_bloc/core/data/infra/model/weather_dorecast_days_model.dart';
import 'package:previsao_tempo_bloc/core/domain/entities/forecast_entity.dart';
import 'package:previsao_tempo_bloc/core/domain/entities/weather_entity.dart';

class WeatherForecastModel extends WeatherEntity {
  final String temperatureModel;
  final String windModel;
  final String descriptionModel;
  final List<ForecastEntity> forecastModel;

  WeatherForecastModel({
    required this.temperatureModel,
    required this.windModel,
    required this.descriptionModel,
    required this.forecastModel,
  }) : super(
          description: descriptionModel,
          forecast: forecastModel,
          temperature: temperatureModel,
          wind: windModel,
        );

  static WeatherForecastModel fromMap(map) {
    return WeatherForecastModel(
        descriptionModel: map['description'],
        windModel: map['wind'],
        temperatureModel: map['temperature'],
        forecastModel: (map['forecast'] as List).map((e) => WeatherForecastDaysModel.fromJson(e)).toList());
  }
}
