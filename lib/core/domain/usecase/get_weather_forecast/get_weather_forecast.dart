import 'package:previsao_tempo_bloc/core/domain/entities/weather_entity.dart';
import 'package:previsao_tempo_bloc/core/domain/repository/weather_forecast_repository_interface.dart';
import 'package:previsao_tempo_bloc/core/domain/usecase/get_weather_forecast/get_weather_forecast_interface.dart';

class WeatherForecastUseCase implements IGetWeatherForecast {
  final IWatherForecastRepository repository;
  WeatherForecastUseCase(this.repository);
  @override
  Future<WeatherEntity> featchWeatherForecast(String city) async {
    return await repository.getWheaterForecast(city);
  }
}
