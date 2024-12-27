import 'package:flutter/material.dart';

class ReviewView extends StatefulWidget {
  @override
  _ReviewViewState createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  int score = 0;
  String title = '';
  String review = '';
  String username = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Score Section (Stars)
              Text('Score:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(5, (index) {
                  int star = index + 1;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        score = star;
                      });
                    },
                    child: Icon(
                      star <= score ? Icons.star : Icons.star_border,
                      color: star <= score ? Colors.yellow : Colors.grey,
                      size: 30,
                    ),
                  );
                }),
              ),
              SizedBox(height: 16),

              // Title TextField
              TextField(
                decoration: InputDecoration(
                  labelText: 'Review Title',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  setState(() {
                    title = text;
                  });
                },
              ),
              SizedBox(height: 16),

              // Review TextEditor
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Your Review',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  setState(() {
                    review = text;
                  });
                },
              ),
              SizedBox(height: 16),

              // Username TextField
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  setState(() {
                    username = text;
                  });
                },
              ),
              SizedBox(height: 16),

              // Email TextField
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (text) {
                  setState(() {
                    email = text;
                  });
                },
              ),
              SizedBox(height: 20),

              // Post Button
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    // You can add logic here to save the review or submit it
                    Navigator.pop(context); // Dismiss and go back
                  },
                  child: Text('Post'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
