abstract class IWeatherForecastDatasource {
  Future<dynamic> getForecast(String city);
}
