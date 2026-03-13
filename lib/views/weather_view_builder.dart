import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_now/models/weather_model.dart';
import 'package:news_now/service/weather_service.dart';
import 'package:news_now/widget/weather/weather_search_bar.dart';
import 'package:news_now/views/weather_view.dart';

class WeatherViewBuilder extends StatefulWidget {
  const WeatherViewBuilder({super.key});

  @override
  State<WeatherViewBuilder> createState() => _WeatherViewBuilderState();
}

class _WeatherViewBuilderState extends State<WeatherViewBuilder> {
  var future;

  @override
  void initState() {
    super.initState();
    // Initialize future as null to prompt user to search first
    future = null;
  }

  Future<WeatherModel> _getWeather(String city) async {
    WeatherModel weatherModel = await WeatherService(
      Dio(),
    ).getCurrentWeather(cityName: city);
    return weatherModel;
  }

  void _onSearch(String value) {
    if (value.isNotEmpty) {
      setState(() {
        future = _getWeather(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Weather',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2B32B2), Color(0xFF1488CC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          // Moved SafeArea here instead of inside Column
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                child: WeatherSearchBar(onSearch: _onSearch),
              ),
              Expanded(
                child: future == null
                    ? const Center(
                        child: Text(
                          "Please search for a city",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : FutureBuilder<WeatherModel>(
                        future: future,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return WeatherView(weatherModel: snapshot.data!);
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "Error: ${snapshot.error}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          }
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
