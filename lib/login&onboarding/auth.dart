import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messmaven_minor_project/login&onboarding/google_auth_screen.dart';
import 'package:messmaven_minor_project/nav_screens/base_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(

        stream: FirebaseAuth.instance.authStateChanges(),

        builder: (context, AsyncSnapshot<User?> snapshot){
          print("Hello");
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasData)
          {
            print(snapshot.data.toString());
            return BaseScreen();
          }
          else{
            print('Null snapshot');
            return LoginScreen();
          }
        },
      )
    );
  }
}
