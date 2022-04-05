import 'package:previsao_tempo_bloc/core/data/infra/datasource/weather_forecast_datasource_interface.dart';
import 'package:previsao_tempo_bloc/core/data/infra/model/weather_forecast_model.dart';
import 'package:previsao_tempo_bloc/core/domain/repository/weather_forecast_repository_interface.dart';

class WeatherForecastRepository extends IWatherForecastRepository {
  final IWeatherForecastDatasource dataSource;

  WeatherForecastRepository(this.dataSource);
  @override
  Future<WeatherForecastModel> getWheaterForecast(String city) async {
    final result = await dataSource.getForecast(city);

    return WeatherForecastModel.fromMap(result);
  }
}
