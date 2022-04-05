import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:previsao_tempo_bloc/core/data/infra/model/weather_forecast_model.dart';
import 'package:previsao_tempo_bloc/core/data/infra/repository/weather_forecast_repository.dart';
import 'package:previsao_tempo_bloc/core/domain/entities/weather_entity.dart';
import 'package:previsao_tempo_bloc/core/domain/usecase/get_weather_forecast/get_weather_forecast.dart';

class WeatherForecastRepositoryMock extends Mock implements WeatherForecastRepository {}

void main() {
  late WeatherForecastRepositoryMock repository;
  late WeatherForecastUseCase usecase;
  setUpAll(() {
    repository = WeatherForecastRepositoryMock();
    usecase = WeatherForecastUseCase(repository);
  });
  test('Deve Atribuir dados a variavel wheather quando o metodo getWeatherForecast for chamado', () async {
    when(() => repository.getWheaterForecast('')).thenAnswer((invocation) async => WeatherForecastModel(
        descriptionModel: 'Sunny', temperatureModel: '15 C', windModel: '5km/h', forecastModel: []));
    final result = await usecase.featchWeatherForecast('');
    expect(result, isA<WeatherEntity>());
  });
}
