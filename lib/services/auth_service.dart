import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //Google Sign in

  Future<void> handleSignIn() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        await _auth.signInWithCredential(credential);
        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> BaseScreen()));
      }
    } catch (e) {
      print("Error signing in with google $e");
    }
  }
  Future<void> handleSignOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      print('error signing out:$e');
    }
  }
}