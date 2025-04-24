/// Constants used throughout the application
class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // App Information
  static const String appName = 'Do It!';
  static const String appVersion = '1.0.0';

  // API Endpoints
  static const String baseUrl = 'https://api.example.com';
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';
  static const String updateProfileEndpoint = '/user/profile';
  static const String tasksEndpoint = '/tasks';

  // Shared Preferences Keys
  static const String tokenKey = 'auth_token';
  static const String userIdKey = 'user_id';
  static const String usernameKey = 'username';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language';

  // Validation
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 20;
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 20;

  // UI Constants
  static const double defaultPadding = 24.0;
  static const double defaultBorderRadius = 15.0;
  static const double defaultButtonHeight = 48.0;
  static const double defaultButtonWidth = 331.0;
  static const double defaultIconSize = 24.0;
  static const double defaultImageSize = 200.0;

  // Animation Durations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration splashDuration = Duration(seconds: 2);
  static const Duration snackbarDuration = Duration(seconds: 3);

  // Error Messages
  static const String requiredFieldError = 'This field is required';
  static const String invalidEmailError = 'Please enter a valid email';
  static const String invalidPasswordError =
      'Password must be at least 6 characters';
  static const String passwordMismatchError = 'Passwords do not match';
  static const String invalidUsernameError =
      'Username must be between 3 and 20 characters';
  static const String networkError = 'Please check your internet connection';
  static const String serverError =
      'Something went wrong. Please try again later';
  static const String sessionExpiredError =
      'Your session has expired. Please login again';

  // Success Messages
  static const String loginSuccess = 'Login successful';
  static const String registerSuccess = 'Registration successful';
  static const String profileUpdateSuccess = 'Profile updated successfully';
  static const String passwordChangeSuccess = 'Password changed successfully';
  static const String taskAddSuccess = 'Task added successfully';
  static const String taskUpdateSuccess = 'Task updated successfully';
  static const String taskDeleteSuccess = 'Task deleted successfully';
}
