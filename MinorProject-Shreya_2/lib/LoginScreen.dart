import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../RegisterScreen.dart';
import '../LandingPage.dart';

TextField reusableTextField(
    String label, bool obscureText, TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(labelText: label),
  );
}

class LoginScreen extends StatelessWidget {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            reusableTextField('Email', true, _emailTextController),
            reusableTextField('password', false, _passwordTextController),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                      email: 'email',
                      password: 'password',
                    )
                    .then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondScreen())));
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text('Create an account'),
            ),
          ],
        ),
      ),
    );
  }
}
