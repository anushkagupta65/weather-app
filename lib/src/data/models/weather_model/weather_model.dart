class WeatherModel {
  final String cityName;
  final String description;
  final String icon;
  final double temp;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final double hTemp;
  final double lTemp;

  WeatherModel({
    required this.cityName,
    required this.description,
    required this.icon,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.hTemp,
    required this.lTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['cityName'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
      temp: (json['temp'] as num).toDouble(),
      pressure: (json['pressure'] as num).toInt(),
      humidity: (json['humidity'] as num).toInt(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      hTemp: (json['hTemp'] as num).toDouble(),
      lTemp: (json['lTemp'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'description': description,
      'icon': icon,
      'temp': temp,
      'pressure': pressure,
      'humidity': humidity,
      'windSpeed': windSpeed,
      'hTemp': hTemp,
      'lTemp': lTemp,
    };
  }
}
