import 'package:flutter_test/flutter_test.dart';
import 'package:previsao_tempo_bloc/core/data/infra/model/weather_dorecast_days_model.dart';

void main() {
  dynamic data = {
    'day': '1',
    'temperature': '+22 °C',
    'wind': '13 km/h',
  };

  test('Deve retornar um objeto do tipo WeatherForecastDaysModel quando o metodo fromjson for chamado', () {
    final result = WeatherForecastDaysModel.fromJson(data);
    expect(result, isA<WeatherForecastDaysModel>());
  });
}
