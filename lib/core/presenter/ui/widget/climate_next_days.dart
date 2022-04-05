import 'package:flutter/material.dart';
import 'package:previsao_tempo_bloc/core/domain/entities/weather_entity.dart';

class ClimateNextDays extends StatelessWidget {
  final int itemCount;
  final List forecast;
  final double width;
  const ClimateNextDays({
    required this.width,
    required this.forecast,
    required this.itemCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.65,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: forecast.length,
          itemBuilder: (_, index) {
            final climateDay = forecast[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        '',
                        style: const TextStyle(
                          color: Color(0xFF81B9DD),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 3,
                        width: 20,
                        color: const Color(0xFF81B9DD),
                      )
                    ],
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 25,
                    width: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF81B9DD),
                    ),
                    child: Text(
                      climateDay.temperature,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    climateDay.wind,
                    style: const TextStyle(
                      color: Color(0xFF81B9DD),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
