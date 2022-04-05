import 'package:bloc/bloc.dart';
import 'package:previsao_tempo_bloc/core/domain/usecase/get_weather_forecast/get_weather_forecast.dart';
import 'package:previsao_tempo_bloc/core/presenter/bloc/event/forecast_event.dart';
import 'package:previsao_tempo_bloc/core/presenter/bloc/state/forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final WeatherForecastUseCase useCase;
 
  ForecastBloc(this.useCase) : super(EmptyState()) {
    on<SearchCityEvent>(_searchCity);
  }
  Future<void> _searchCity(SearchCityEvent event, Emitter<ForecastState> emit) async {
    emit(LoadingForecastState());

    try {
      final forecast = await useCase.featchWeatherForecast(event.city);
      emit(SuccessForecastState(forecast: forecast));
    } catch (e) {
      emit(ErrorForecastState(e.toString()));
    }
  }
}
