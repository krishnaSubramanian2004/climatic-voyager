import 'package:flutter/material.dart';

class PreferencesView extends StatefulWidget {
  @override
  _PreferencesViewState createState() => _PreferencesViewState();
}

class _PreferencesViewState extends State<PreferencesView> {
  // Selected mode (default to light)
  String selectedMode = "light or dark";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Preferences',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Preferences',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Preferences settings affect your view of the entire application.',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 32),

            // Dropdown for selecting mode
            Text(
              'Mode',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: selectedMode,
                isExpanded: true,
                underline: SizedBox(),
                items: [
                  'light or dark',
                  'light',
                  'dark',
                ].map((mode) {
                  return DropdownMenuItem<String>(
                    value: mode,
                    child: Text(mode),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedMode = value!;
                  });
                },
              ),
            ),
            Spacer(),

            // Save Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle save action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Preferences saved!')),
                  );
                },
                style: ElevatedButton.styleFrom(

                  padding:
                  EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PreferencesView(),
  ));
}
