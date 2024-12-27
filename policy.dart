import 'package:flutter/material.dart';

class PolicyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Policy Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Description
            Text(
              '''
              At Climatic Voyager, your privacy is our priority. We collect minimal data to enhance your experience, including personal preferences and usage data for improvements. We never share your details without consent and implement strict security measures to protect your information.
              ''',
              style: TextStyle(
                fontSize: 16,
                height: 1.5, // Line spacing equivalent to SwiftUI's lineSpacing
              ),
            ),
            Spacer(), // Pushes content to the top
          ],
        ),
      ),
    );
  }
}
