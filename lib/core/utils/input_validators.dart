class InputValidators {
  static String? validateEmail(String email) {
    if (email.isEmpty) return 'Email is required';
    if (!email.contains('@')) return 'Invalid email format';
    return null;
  }

  static String? validateMobile(String mobile) {
    if (mobile.isEmpty) return 'mobile is required';
    if (mobile.length < 10) return 'Mobile number must be at least 10 digits';
    return null;
  }

  static String? validateUserName(String userName) {
    if (userName.isEmpty) return 'UserName is required';
    if (userName.length < 4)
      return 'Username must be at least 4 characters long';
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) return 'Password is required';
    if (password.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  static String? confirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) return 'Please confirm your password';
    if (password.trim() != confirmPassword.trim())
      return 'Passwords do not match';
    return null;
  }
}
