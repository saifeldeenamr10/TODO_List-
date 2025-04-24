import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/route_constants.dart';
import 'features/auth/screens/splash_screen.dart';
import 'features/auth/screens/lets_start_page.dart';
import 'features/auth/screens/login_page.dart';
import 'features/auth/screens/register_page.dart';
import 'features/tasks/screens/home1_page.dart';
import 'features/tasks/screens/home2_page.dart';
import 'features/tasks/screens/add_task_page.dart';
import 'features/profile/screens/update_profile_page.dart';
import 'features/profile/screens/change_password_page.dart';
import 'features/profile/screens/language_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Do It!',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: RouteConstants.splash,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RouteConstants.splash:
            return MaterialPageRoute(builder: (_) => const SplashScreen());
          case RouteConstants.letsStart:
            return MaterialPageRoute(builder: (_) => const LetsStartPage());
          case RouteConstants.login:
            return MaterialPageRoute(builder: (_) => const LoginPage());
          case RouteConstants.register:
            return MaterialPageRoute(builder: (_) => const RegisterPage());
          case RouteConstants.home:
            final args = settings.arguments as Map<String, dynamic>?;
            return MaterialPageRoute(
              builder: (_) => Home1Page(
                username: args?['username'] ?? 'Guest',
              ),
            );
          case RouteConstants.home2:
            final args = settings.arguments as Map<String, dynamic>?;
            return MaterialPageRoute(
              builder: (_) => Home2Page(
                username: args?['username'] ?? 'Guest',
                tasks: args?['tasks'] ?? [],
              ),
            );
          case RouteConstants.addTask:
            return MaterialPageRoute(builder: (_) => const AddTaskPage());
          case RouteConstants.updateProfile:
            final args = settings.arguments as Map<String, dynamic>?;
            return MaterialPageRoute(
              builder: (_) => UpdateProfilePage(
                currentUsername: args?['username'] ?? '',
              ),
            );
          case RouteConstants.changePassword:
            return MaterialPageRoute(
                builder: (_) => const ChangePasswordPage());
          case RouteConstants.language:
            return MaterialPageRoute(builder: (_) => const LanguagePage());
          default:
            return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
      },
    );
  }
}
