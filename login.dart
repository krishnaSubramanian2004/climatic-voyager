import 'package:climate/main.dart';
import 'package:flutter/material.dart';

class LoginPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Login Title
            Text(
              "Sign In",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Email Input
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Password Input
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Sign In Button
            ElevatedButton(
              onPressed: () {
                // Navigate to DashboardView on sign in
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardView()),
                );
              },
              child: Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
