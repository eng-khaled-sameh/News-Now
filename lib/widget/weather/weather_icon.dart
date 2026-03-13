import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String iconUrl;

  const WeatherIcon({super.key, required this.iconUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      iconUrl,
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
  }
}
