import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orix_food/core/services/shared_prefrence_service.dart';
import 'package:orix_food/views/Registration_Login.dart';
import 'package:orix_food/views/home_page.dart';

import '../utils/input_validators.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final SharedPrefService _sharedPrefService = SharedPrefService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential?> signUpWithEmailPassword(
    String email,
    String password,
    BuildContext context,
    String confirmPass,
    String mobile,
    String userName,
  ) async {
    try {
      final userNameError = InputValidators.validateUserName(userName);
      final emailError = InputValidators.validateEmail(email);
      final mobileError = InputValidators.validateMobile(mobile);
      final passwordError = InputValidators.validatePassword(password);
      final confirmError = InputValidators.confirmPassword(
        password,
        confirmPass,
      );

      if (userNameError != null ||
          emailError != null ||
          mobileError != null ||
          passwordError != null ||
          confirmError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              emailError ??
                  passwordError ??
                  confirmError ??
                  mobileError ??
                  userNameError!,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
        return null;
      }

      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      //Save user data to Firestore
      User? user = userCredential.user;
      if (user != null) {
        await _firestore.collection('users').doc(user!.uid).set({
          'uid': userCredential.user!.uid,
          'email': email.trim(),
          'userName': userName.trim(),
          'mobile': mobile.trim(),
          'password': password.trim(),
        });
      }

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginRegistration_Screen()),
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message ?? 'Something went wrong',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }
  }

  Future<UserCredential?> signInWithEmailPassword(
    String email,
    String password,
    BuildContext context, // Pass context here
  ) async {
    try {
      final emailError = InputValidators.validateEmail(email);
      final passwordError = InputValidators.validatePassword(password);

      if (emailError != null || passwordError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              emailError ?? passwordError!,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
        return null;
      }
      dynamic userCredential;

      try {
        userCredential = await _auth.signInWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        );

        final user = userCredential.user;
        if (user != null) {
          await _sharedPrefService.saveLoginData(user.uid);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        }

        return userCredential;

        /*Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));*/
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Incorrect Email or Password')));
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message ?? 'Something went wrong',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }
  }

  Future<void> logOut(BuildContext context) async {
    await _auth.signOut();
    await _sharedPrefService.clearLoginData();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginRegistration_Screen()),
    );
  }
}
