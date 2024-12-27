import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'ABOUT US',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Description
            Text(
              ''' 
              Welcome to Climatic Voyager! We're dedicated to empowering travelers with real-time weather insights, destination highlights, and personalized trip recommendations. Our mission is to make every journey informed and enjoyable, helping you explore the world with confidence. Travel smart, stay inspired, and journey with Climatic Voyager!
              ''',
              style: TextStyle(
                fontSize: 16,
                height: 1.5, // Line spacing equivalent to SwiftUI's lineSpacing
              ),
            ),
            Spacer(), // To push content to the top
          ],
        ),
      ),
    );
  }
}
