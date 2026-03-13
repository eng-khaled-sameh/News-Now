import 'package:flutter/material.dart';

class WeatherDetailsCard extends StatelessWidget {
  final int humidity;
  final double maxTemp;
  final double minTemp;

  const WeatherDetailsCard({
    super.key,
    required this.humidity,
    required this.maxTemp,
    required this.minTemp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildWeatherDetail(
            icon: Icons.water_drop_outlined,
            label: 'Humidity',
            value: '$humidity%',
          ),
          _buildWeatherDetail(
            icon: Icons.arrow_upward_rounded,
            label: 'Max Temp',
            value: '${maxTemp.round()}°',
          ),
          _buildWeatherDetail(
            icon: Icons.arrow_downward_rounded,
            label: 'Min Temp',
            value: '${minTemp.round()}°',
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetail({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white70, size: 28),
        const SizedBox(height: 12),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
