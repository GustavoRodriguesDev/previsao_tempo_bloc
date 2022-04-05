abstract class ForecastEvent {}

class SearchCityEvent implements ForecastEvent {
  String city;
  SearchCityEvent({this.city = 'Nova Campina'});
}
