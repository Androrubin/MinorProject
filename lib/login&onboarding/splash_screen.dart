import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messmaven_minor_project/nav_screens/base_screen.dart';
import 'google_auth_screen.dart';

Color cardColor = const Color(0xFF1F283E);
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>with SingleTickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth auth = FirebaseAuth.instance;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    if(auth.currentUser!= null){
      Future.delayed(Duration(seconds: 2),(){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> BaseScreen()));
      });
    }else{
      Future.delayed(Duration(seconds: 2),(){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> LoginScreen()));
      });
    }
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color : cardColor,
        child: Text('Mess Maven',style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.white)),
      ),
    );
  }
}
