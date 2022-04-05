import 'package:previsao_tempo_bloc/core/domain/entities/forecast_entity.dart';

class WeatherEntity {
  final String temperature;
  final String wind;
  final String description;
  final List<ForecastEntity> forecast;

  const WeatherEntity({
    required this.description,
    required this.forecast,
    required this.temperature,
    required this.wind,
  });
}
