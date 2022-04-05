import 'package:flutter_test/flutter_test.dart';
import 'package:previsao_tempo_bloc/core/data/infra/model/weather_forecast_model.dart';

void main() {
  dynamic data = {
    'temperature': '+25 °C',
    'wind': '5 km/h',
    'description': 'Sunny',
    'forecast': [
      {'day': '1', 'temperature': '+22 °C', 'wind': '13 km/h'},
      {'day': '2', 'temperature': '+25 °C', 'wind': '14 km/h'},
      {'day': '3', 'temperature': '+15 °C', 'wind': '30 km/h'}
    ]
  };
  test('Deve retonar um objeto do tipo WeatherForecastModel quando o metodo fromMap for chamado', () async {
    final result = WeatherForecastModel.fromMap(data);
    expect(result, isA<WeatherForecastModel>());
  });
}
