import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/route_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/app_assets.dart';
import '../../../features/common_widgets/custom_button.dart';
import '../../../features/common_widgets/custom_text_field.dart';
import '../../../features/tasks/screens/home1_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  String? _usernameError;
  String? _passwordError;

  void _handleLogin() {
    setState(() {
      _usernameError = _usernameController.text.isEmpty
          ? AppConstants.requiredFieldError
          : null;
      _passwordError = _passwordController.text.isEmpty
          ? AppConstants.requiredFieldError
          : null;
    });

    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      // TODO: Implement actual login logic with backend
      // For now, we'll just navigate to home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home1Page(
            username: _usernameController.text,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_onUsernameChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  void _onUsernameChanged() {
    if (_usernameController.text.isNotEmpty) {
      setState(() {
        _usernameError = null;
      });
    }
  }

  void _onPasswordChanged() {
    if (_passwordController.text.isNotEmpty) {
      setState(() {
        _passwordError = null;
      });
    }
  }

  @override
  void dispose() {
    _usernameController.removeListener(_onUsernameChanged);
    _passwordController.removeListener(_onPasswordChanged);
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppConstants.defaultBorderRadius),
                    child: Image.asset(
                      AppAssets.palestineFlag,
                      height: AppConstants.defaultImageSize,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 48),
                  CustomTextField(
                    controller: _usernameController,
                    label: 'Username',
                    hint: 'Enter your username',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    style: AppTextStyles.bodyMedium,
                    labelStyle: AppTextStyles.label,
                    hintStyle: AppTextStyles.label,
                    errorText: _usernameError,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _passwordController,
                    label: 'Password',
                    hint: 'Enter your password',
                    obscureText: !_isPasswordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    style: AppTextStyles.bodyMedium,
                    labelStyle: AppTextStyles.label,
                    hintStyle: AppTextStyles.label,
                    errorText: _passwordError,
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: Container(
                      width: AppConstants.defaultButtonWidth,
                      height: AppConstants.defaultButtonHeight,
                      padding: EdgeInsets.zero,
                      child: CustomButton(
                        text: 'Login',
                        onPressed: _handleLogin,
                        backgroundColor: AppColors.primary,
                        borderRadius: AppConstants.defaultBorderRadius,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have An Account?",
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Register',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
