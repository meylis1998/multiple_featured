import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:test_app/app/data/models/weather_model.dart';

class WeatherController extends GetxController {
  final weather = Weather(
    cityName: '',
    description: '',
    temperature: 0.0,
    humidity: 0.0,
    windSpeed: 0.0,
  ).obs;

  final city = 'Saratov'.obs;
  late Timer _timer; // Timer for periodic updates

  @override
  void onInit() {
    super.onInit();
    updateWeatherData();
    // Start a timer to update data every 2-3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (_) {
      updateWeatherData();
    });
  }

  @override
  void onClose() {
    super.onClose();
    // Cancel the timer when the controller is disposed to prevent memory leaks
    _timer.cancel();
  }

  void updateWeatherData() async {
    const apiKey = '4575241bcbc8f673106e1561aded209c';

    final apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=${city.value}&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      final jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        final newWeather = Weather.fromJson(jsonData);
        weather.value = newWeather;
      } else {
        // Обработка ошибок, если не удалось получить данные
        debugPrint('Ошибка при загрузке данных: ${response.statusCode}');
      }
    } catch (error) {
      // Обработка ошибок, если не удалось выполнить запрос
      debugPrint('Ошибка при выполнении запроса: $error');
    }
  }

  void changeCity(String newCity) {
    city.value = newCity;
  }
}
