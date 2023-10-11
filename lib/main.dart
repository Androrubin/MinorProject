import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messmaven_minor_project/login&onboarding/enter_details_screen.dart';
import 'package:messmaven_minor_project/login&onboarding/google_auth_screen.dart';
import 'package:messmaven_minor_project/login&onboarding/splash_screen.dart';
import 'package:messmaven_minor_project/nav_screens/base_screen.dart';

import 'firebase_options.dart';

Color cardColor = const Color(0xFF1F283E);

void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: SplashScreen(),
      routes: {
        '/home': (context) => BaseScreen(), // Navigate to HomeScreen after the splash screen
      },
    );
  }
}


