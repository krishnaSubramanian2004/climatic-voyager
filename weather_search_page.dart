import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherSearchPage extends StatefulWidget {
  final String? initialCity;

  WeatherSearchPage({this.initialCity});

  @override
  _WeatherSearchPageState createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  final TextEditingController _cityController = TextEditingController();
  Map<String, dynamic>? _weatherData;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    if (widget.initialCity != null) {
      _cityController.text = widget.initialCity!;
      fetchWeather(widget.initialCity!);
    }
  }

  Future<void> fetchWeather(String city) async {
    final String apiUrl = 'http://127.0.0.1:5000/weather?city=$city';

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        setState(() {
          _weatherData = json.decode(response.body);
          _isLoading = false;
        });
      } else {
        final errorResponse = json.decode(response.body);
        setState(() {
          _errorMessage = errorResponse['error'] ?? 'Failed to fetch weather data.';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred. Please try again.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                hintText: "Enter city name",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    if (_cityController.text.isNotEmpty) {
                      fetchWeather(_cityController.text);
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            if (_isLoading)
              Center(child: CircularProgressIndicator())
            else if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red, fontSize: 16),
              )
            else if (_weatherData != null)
                WeatherDetails(weatherData: _weatherData!),
          ],
        ),
      ),
    );
  }
}

class WeatherDetails extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  WeatherDetails({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "City: ${weatherData['city']}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Weather: ${weatherData['weather']}"),
            Text("Temperature: ${weatherData['temperature']}°C"),
            Text("Humidity: ${weatherData['humidity']}%"),
            Text("Pressure: ${weatherData['pressure']} hPa"),
            Text("Wind Speed: ${weatherData['wind_speed']} km/h"),
          ],
        ),
      ),
    );
  }
}
