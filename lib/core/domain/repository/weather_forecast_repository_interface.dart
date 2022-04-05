import 'package:previsao_tempo_bloc/core/data/infra/model/weather_forecast_model.dart';

abstract class IWatherForecastRepository {
  Future<WeatherForecastModel> getWheaterForecast(String city);
}
