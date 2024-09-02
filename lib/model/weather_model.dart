
class Weather {
  final String cityName;
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final double feelsLike;
  final String mainCondition;
  final int humidity;
  final int pressure;
  final double windSpeed;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.maxTemperature,
    required this.minTemperature,
    required this.mainCondition,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.windSpeed
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      minTemperature: json['main']['temp_min'].toDouble(),
      maxTemperature: json['main']['temp_max'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      feelsLike: (json['main']['feels_like']).toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      windSpeed: (json['wind']['speed']).toDouble(),
    );
  }
}