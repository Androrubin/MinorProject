import 'package:flutter/material.dart';

class ExtrasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              // Top Illustration
              Container(
                height: 300, // Adjust the height as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/boy_eating_illus.png'),
                    // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Space between illustration and button
              SizedBox(height: 20.0),
              // Google Sign-In Button
              Container(
                width: 260,
                child:
              ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  // Button background color
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://freelogopng.com/images/all_img/1657952641google-logo-png-image.png',
                        // Replace with your Google logo image path
                        height: 30.0,
                        width: 30.0,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ),
            ],
          ),
        ),);
  }
}