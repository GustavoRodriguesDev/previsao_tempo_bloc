import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:previsao_tempo_bloc/core/data/external/datasourcer/weather_forecast_datasource.dart';
import 'package:previsao_tempo_bloc/core/data/infra/model/weather_forecast_model.dart';
import 'package:previsao_tempo_bloc/core/data/infra/repository/weather_forecast_repository.dart';

class WeatherForecastDatasourceMock extends Mock implements WeatherForecastDatasource {}

void main() {
  late WeatherForecastRepository repository;
  late WeatherForecastDatasource datasource;
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

  setUp(() {
    datasource = WeatherForecastDatasourceMock();
    repository = WeatherForecastRepository(datasource);
  });

  test('Deve retornar um WeatherForecastModel quando o metodo getWheaterForecast for chamado', () async {
    when(() => datasource.getForecast('')).thenAnswer((_) async => data);
    final result = await repository.getWheaterForecast('');
    expect(result, isA<WeatherForecastModel>());
  });
}
