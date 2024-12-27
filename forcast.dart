import 'package:flutter/material.dart';

class WeatherForecastView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Pop the current screen and return to the previous screen (WeatherSummaryView)
            Navigator.pop(context);
          },
        ),
        title: Text("Weather Forecast"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.withOpacity(0.8), Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Header with Date
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Text(
                    "Sep 12",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // Today's Forecast Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(5, (index) {
                          return Container(
                            margin: EdgeInsets.only(right: 20),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: index == 2
                                  ? Colors.white.withOpacity(0.3)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "29°C",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.wb_cloudy,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                Text(
                                  "15:00",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),

              // Next Forecast Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next Forecast",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sep ${13 + index}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                _getWeatherIcon(index),
                                size: 30,
                                color: Colors.white,
                              ),
                              Text(
                                "${20 + index * 5}°",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),

              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to get weather icons based on index
  IconData _getWeatherIcon(int index) {
    switch (index) {
      case 0:
        return Icons.bolt; // Thunderstorm
      case 1:
        return Icons.thunderstorm; // Rainy
      case 2:
        return Icons.sunny; // Sunny
      case 3:
        return Icons.cloud; // Cloudy
      default:
        return Icons.wb_sunny; // Default sunny
    }
  }
}
