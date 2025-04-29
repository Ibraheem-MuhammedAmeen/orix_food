import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signUpWithEmailPassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        // Show Snackbar for invalid input
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Please fill out all fields correctly!',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
        // return;
      }
      if (!email.contains('@')) {
        // Show Snackbar for invalid input
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Invalid email! Please enter a valid email address.',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
      email.trim();
      password.trim();
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
      return userCredential;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }
  }
}
