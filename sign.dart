import 'package:flutter/material.dart';
import 'login.dart'; // Import LoginPageView class

class Sign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40), // Space at the top

              Spacer(), // Adds space before "Sign In" button

              // "Sign In" Button
              GestureDetector(
                onTap: () {
                  // Navigate to Login Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPageView(), // Navigates to the Login page
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 80),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Sign In",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Spacer(), // Adds space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
