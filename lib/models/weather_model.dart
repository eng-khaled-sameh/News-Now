class WeatherModel {
  final String date;
  final String cityName;
  final String condition;
  final String iconUrl;
  final double tempC;
  final double maxTemp;
  final double minTemp;
  final int humidity;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.condition,
    required this.iconUrl,
    required this.maxTemp,
    required this.tempC,
    required this.minTemp,
    required this.humidity,
  });

  factory WeatherModel.fromjson(Map<String, dynamic> json) {
    var dayData = json['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      cityName: json['location']['name'],
      date: json['location']['localtime'],
      condition: json['current']['condition']['text'],
      iconUrl: 'https:${json['current']['condition']['icon']}',
      tempC: json['current']['temp_c'].toDouble(),
      humidity: json['current']['humidity'],
      maxTemp: dayData['maxtemp_c'].toDouble(),
      minTemp: dayData['mintemp_c'].toDouble(),
    );
  }
}
