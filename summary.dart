import 'package:climate/screens/forcast.dart';
import 'package:flutter/material.dart';

class WeatherSummaryView extends StatefulWidget {
  @override
  _WeatherSummaryViewState createState() => _WeatherSummaryViewState();
}

class _WeatherSummaryViewState extends State<WeatherSummaryView> {
  int numberOfPeople = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Summary"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Calendar and People Selection Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to CalendarView (stub implementation here)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CalendarView()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 8),
                      Text("Sep 12 - Sep 15"),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.people),
                    SizedBox(width: 8),
                    Text("$numberOfPeople"),
                    SizedBox(width: 8),
                    SizedBox(
                      width: 100,
                      child: Slider(
                        value: numberOfPeople.toDouble(),
                        min: 1,
                        max: 10,
                        divisions: 9,
                        label: "$numberOfPeople",
                        onChanged: (value) {
                          setState(() {
                            numberOfPeople = value.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Analyze Button
            ElevatedButton(
              onPressed: () {
                // Navigate to WeatherForecastView
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => WeatherForecastView()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Analyze",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),

            // Weather Summary Display
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wb_cloudy, size: 100, color: Colors.blue),
                  SizedBox(height: 10),
                  Text(
                    "29°",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Cloudy",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.wind_power, color: Colors.blue),
                          SizedBox(width: 5),
                          Text("Wind 10 km/h"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.water_drop, color: Colors.blue),
                          SizedBox(width: 5),
                          Text("Hum 54%"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Stub for CalendarView
class CalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Text("Calendar View"),
      ),
    );
  }
}
