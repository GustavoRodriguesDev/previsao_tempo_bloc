import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:previsao_tempo_bloc/core/data/external/datasourcer/weather_forecast_datasource.dart';
import 'package:uno/uno.dart';

class UnoMock extends Mock implements Uno {}

class ResponseMock extends Mock implements Response {
  dynamic dataMock;
  ResponseMock({this.dataMock});
}

void main() {
  late UnoMock uno;
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

  setUpAll(() {
    uno = UnoMock();
    datasource = WeatherForecastDatasource(uno);
  });

  test('Deve Retornar um Dynamic quando o metodo for chamado', () async {
    when(() => uno.get(any())).thenAnswer((invocation) async => ResponseMock(dataMock: data));
    final response = await datasource.getForecast('');
    expect(response, isA<dynamic>());
  });
}
