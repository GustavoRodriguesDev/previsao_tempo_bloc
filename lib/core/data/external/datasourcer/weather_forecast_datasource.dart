import 'package:previsao_tempo_bloc/core/data/infra/datasource/weather_forecast_datasource_interface.dart';
import 'package:uno/uno.dart';

class WeatherForecastDatasource extends IWeatherForecastDatasource {
  final Uno uno;

  WeatherForecastDatasource(this.uno);

  @override
  Future<dynamic> getForecast(String city) async {
    final response = await uno.get('https://goweather.herokuapp.com/weather/$city');
    return response.data;
  }
}
