import 'package:flutter/material.dart';
import '../core/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Make sure this is imported

class RegisterViewModel with ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> registerUser(
    String email,
    String password,
    BuildContext context,
    String confirmPass,
    String mobile,
    String userName,
  ) async {
    _isLoading = true;
    notifyListeners(); // Let the UI know we started loading

    UserCredential? user; // Declare it outside so it's accessible below

    try {
      user = await _authService.signUpWithEmailPassword(
        email,
        password,
        context,
        confirmPass,
        mobile,
        userName,
      );
    } catch (e) {
      debugPrint('Register Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners(); // Let the UI know we're done
    }
  }
}
