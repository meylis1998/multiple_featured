import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({super.key});

  final WeatherController weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Город: ${weatherController.weather.value.cityName}'),
              Text('Описание: ${weatherController.weather.value.description}'),
              Text('Температура: ${weatherController.weather.value.temperature.toStringAsFixed(2)}°C'),
              Text('Влажность: ${weatherController.weather.value.humidity.toStringAsFixed(2)}%'),
              Text('Скорость ветра: ${weatherController.weather.value.windSpeed.toStringAsFixed(2)} м/с'),
              const SizedBox(height: 20),
              TextField(
                onChanged: (newCity) => weatherController.changeCity(newCity),
                decoration: const InputDecoration(
                  labelText: 'Введите город',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
