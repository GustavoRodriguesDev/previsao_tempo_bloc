import 'package:previsao_tempo_bloc/core/domain/entities/forecast_entity.dart';

class WeatherForecastDaysModel extends ForecastEntity {
  final String dayModel;
  final String temperatureModel;
  final String windModel;

  WeatherForecastDaysModel({
    required this.dayModel,
    required this.temperatureModel,
    required this.windModel,
  }) : super(
          day: dayModel,
          temperature: temperatureModel,
          wind: windModel,
        );

  static WeatherForecastDaysModel fromJson(json) {
    return WeatherForecastDaysModel(
      dayModel: json['day'],
      temperatureModel: json['temperature'],
      windModel: json['wind'],
    );
  }
}
