import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:previsao_tempo_bloc/core/presenter/bloc/event/forecast_event.dart';
import 'package:previsao_tempo_bloc/core/presenter/bloc/forecast_bloc.dart';
import 'package:previsao_tempo_bloc/core/presenter/bloc/state/forecast_state.dart';
import 'package:previsao_tempo_bloc/core/utils/const.dart';

import 'widget/climate_day.dart';
import 'widget/climate_next_days.dart';

class ForecasPage extends StatefulWidget {
  const ForecasPage({Key? key}) : super(key: key);

  @override
  State<ForecasPage> createState() => _ForecasPageState();
}

class _ForecasPageState extends State<ForecasPage> {
  final SearchCityEvent searchCityEvent = SearchCityEvent();
  final ForecastBloc bloc = Modular.get<ForecastBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(SearchCityEvent());
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                height: height,
                alignment: Alignment.topCenter,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      color: const Color(0xFF81B9DD),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextField(
                          onChanged: (value) => searchCityEvent.city = value,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                bloc.add(searchCityEvent);
                              },
                              child: const Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<ForecastBloc, ForecastState>(
                      bloc: bloc,
                      builder: (context, state) {
                        if (state is LoadingForecastState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is ErrorForecastState) {
                          return Center(
                            child: Text(state.error),
                          );
                        }
                        if (state is SuccessForecastState) {
                          return Column(
                            children: [
                              ClimateDay(
                                description: state.decription,
                                city: searchCityEvent.city,
                                height: height * 0.64,
                                width: width,
                                temp: state.temperature,
                                wind: state.wind,
                                image: state.selectImage(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Container(
                                  height: height * 0.19,
                                  width: width,
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text('Day:', style: textStyle),
                                          SizedBox(height: 6),
                                          Text('Temperature:', style: textStyle),
                                          SizedBox(height: 6),
                                          Text('Wind:', style: textStyle),
                                        ],
                                      ),
                                      SizedBox(width: width * 0.05),
                                      ClimateNextDays(
                                          width: width,
                                          forecast: state.forecastList,
                                          itemCount: state.forecastList.length),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }
                        return Container();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
