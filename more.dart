import 'package:climate/screens/policy.dart';
import 'package:flutter/material.dart';
import 'review.dart'; // Import the ReviewView
import 'about.dart'; // Import the AboutUsView
import 'profile.dart'; // Import PolicyView from the policy directory

class MoreView extends StatelessWidget {
  final List<String> menuItems = [
    "preference",
    "review",
    "privacy policy",
    "terms and conditions",
    "about us",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: menuItems.map((item) {
            return _buildMenuRow(item, context);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildMenuRow(String item, BuildContext context) {
    Widget destination;

    if (item.toLowerCase() == 'preference') {
      destination = PreferencesView();
    } else if (item.toLowerCase() == 'review') {
      destination = ReviewView();
    } else if (item.toLowerCase() == 'privacy policy') {
      destination = PolicyView(); // Navigate to PolicyView in the policy directory
    } else if (item.toLowerCase() == 'terms and conditions') {
      destination = TermsView();
    } else if (item.toLowerCase() == 'about us') {
      destination = AboutUsView();
    } else {
      destination = Container();
    }

    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      title: MenuRow(item: item),
    );
  }
}

class MenuRow extends StatelessWidget {
  final String item;

  MenuRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            color: Colors.purple,
            size: 15,
          ),
          SizedBox(width: 10),
          Text(
            item.capitalize(),
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

// Extension to capitalize the first letter of a string
extension StringCasingExtension on String {
  String capitalize() {
    if (this.isEmpty) {
      return this;
    } else {
      return this[0].toUpperCase() + this.substring(1).toLowerCase();
    }
  }
}

// Dummy Views for navigation (Replace with actual views)
class PreferencesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Preferences View')));
  }
}

class TermsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Terms and Conditions View')));
  }
}
