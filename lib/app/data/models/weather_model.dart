class Weather {
  final String cityName;
  final String description;
  final double temperature;
  final double humidity;
  final double windSpeed;

  Weather({
    required this.cityName,
    required this.description,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weatherData = json['weather'][0];
    final mainData = json['main'];
    final windData = json['wind'];

    return Weather(
      cityName: json['name'],
      description: weatherData['description'],
      temperature: (mainData['temp'] - 273.15), // Convert from Kelvin to Celsius
      humidity: mainData['humidity'].toDouble(),
      windSpeed: windData['speed'].toDouble(),
    );
  }
}
