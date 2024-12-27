import 'package:flutter/material.dart';
import 'package:climate/screens/profile.dart';
import 'package:climate/screens/more.dart';
import 'package:climate/screens/overview.dart';
import 'package:climate/screens/weather_search_page.dart';
import 'package:climate/screens/notification_view.dart'; // Import NotificationView

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search for a city...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WeatherSearchPage(initialCity: value),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Navigate to NotificationView
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => NotificationView()),
              );
            },
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfileView()),
              );
            },
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/image1.png'),
              radius: 15,
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MoreView()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Popular",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shimla",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LocationOverviewView()),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/image2.png',
                      height: 160,
                      width: 420,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
