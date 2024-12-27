import 'package:flutter/material.dart';

class TermsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('T&C'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Terms & Conditions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Description
            Text(
              '''
              By using Climatic Voyager, you agree to our terms, including personal, non-commercial views, and acceptance of our privacy policy. Terms may change, so check periodically.
              ''',
              style: TextStyle(
                fontSize: 16,
                height: 1.5, // Similar to SwiftUI's lineSpacing
              ),
            ),
            Spacer(), // Pushes content to the top
          ],
        ),
      ),
    );
  }
}
