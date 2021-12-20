import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_player/Homepage.dart';
import 'package:music_player/pages/introduction.dart';
import 'package:music_player/pages/signin.dart';

class Authentication {
  loginService() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return OnBoardingPage();
        }
      },
    );
  }

  Future<User?> signout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
