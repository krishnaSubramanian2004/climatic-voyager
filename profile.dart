import 'package:climate/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:climate/main.dart'; // Make sure DashboardView is imported here

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Profile Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      // Navigate to DashboardView when back button is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DashboardView()),
                      );
                    },
                  ),
                  Spacer(),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),

            // Profile Image and Info
            Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profilePicture.jpg'), // Replace with actual image path
                  radius: 50,
                ),
                SizedBox(height: 10),
                Text(
                  "Sara",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Mumbai, India",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Profile Details Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ProfileDetailRow(title: "Username", value: "Sara M"),
                    Divider(),
                    ProfileDetailRow(title: "Email", value: "saraM@gmail.com"),
                    Divider(),
                    ProfileDetailRow(title: "Phone", value: "+9444663647"),
                    Divider(),
                    ProfileDetailRow(title: "Date of birth", value: "March 27, 1989"),
                    Divider(),
                    ProfileDetailRow(title: "Address", value: "63/91 Elgin St, Mumbai"),
                    Divider(),
                    ProfileDetailRow(title: "Account", value: "⚡ Gold"),
                  ],
                ),
              ),
            ),

            Spacer(),

            // Sign Out Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Sign-In View
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => LoginPageView()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  "Sign out",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  final String title;
  final String value;

  const ProfileDetailRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

// Stub for Profile Edit View
class ProfileEditView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Center(
        child: Text("Profile Edit Page"),
      ),
    );
  }
}

// Stub for Welcome View
class WelcomeVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Center(
        child: Text("Welcome Page"),
      ),
    );
  }
}
