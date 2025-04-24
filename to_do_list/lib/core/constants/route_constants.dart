/// Constants for all the routes in the application
class RouteConstants {
  // Private constructor to prevent instantiation
  RouteConstants._();

  // Auth Routes
  static const String splash = '/';
  static const String letsStart = '/lets-start';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';

  // Main Routes
  static const String home = '/home';
  static const String home2 = '/home2';
  static const String addTask = '/add-task';
  static const String editTask = '/edit-task';
  static const String taskDetails = '/task-details';

  // Profile Routes
  static const String profile = '/profile';
  static const String updateProfile = '/update-profile';
  static const String changePassword = '/change-password';
  static const String settings = '/settings';
  static const String language = '/language';
  static const String theme = '/theme';
  static const String about = '/about';
  static const String help = '/help';
  static const String privacyPolicy = '/privacy-policy';
  static const String termsOfService = '/terms-of-service';
}
