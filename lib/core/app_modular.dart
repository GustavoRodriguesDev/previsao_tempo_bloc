import 'package:flutter_modular/flutter_modular.dart';
import 'package:previsao_tempo_bloc/core/data/external/datasourcer/weather_forecast_datasource.dart';
import 'package:previsao_tempo_bloc/core/data/infra/repository/weather_forecast_repository.dart';
import 'package:previsao_tempo_bloc/core/domain/usecase/get_weather_forecast/get_weather_forecast.dart';
import 'package:previsao_tempo_bloc/core/presenter/bloc/forecast_bloc.dart';
import 'package:previsao_tempo_bloc/core/presenter/ui/forecast_page.dart';
import 'package:uno/uno.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Uno()),
        Bind((i) => WeatherForecastDatasource(i())),
        Bind((i) => WeatherForecastRepository(i())),
        Bind((i) => WeatherForecastUseCase(i())),
        Bind((i) => ForecastBloc(i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const ForecasPage(),
        )
      ];
}
