import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/route_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/app_assets.dart';
import '../../../features/common_widgets/custom_button.dart';
import '../../../features/common_widgets/custom_text_field.dart';
import '../../../features/tasks/screens/home1_page.dart';

class RegisterPage extends StatefulWidget {
  final bool isLogin;

  const RegisterPage({
    super.key,
    this.isLogin = false,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String? _usernameError;
  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_onUsernameChanged);
    _passwordController.addListener(_onPasswordChanged);
    _confirmPasswordController.addListener(_onConfirmPasswordChanged);
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

  void _onConfirmPasswordChanged() {
    if (_confirmPasswordController.text.isNotEmpty) {
      setState(() {
        _confirmPasswordError = null;
      });
    }
  }

  @override
  void dispose() {
    _usernameController.removeListener(_onUsernameChanged);
    _passwordController.removeListener(_onPasswordChanged);
    _confirmPasswordController.removeListener(_onConfirmPasswordChanged);
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    setState(() {
      _usernameError = _usernameController.text.isEmpty
          ? AppConstants.requiredFieldError
          : null;
      _passwordError = _passwordController.text.isEmpty
          ? AppConstants.requiredFieldError
          : null;
      if (!widget.isLogin) {
        _confirmPasswordError = _confirmPasswordController.text.isEmpty
            ? AppConstants.requiredFieldError
            : _confirmPasswordController.text != _passwordController.text
                ? AppConstants.passwordMismatchError
                : null;
      }
    });

    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        (widget.isLogin || _confirmPasswordController.text.isNotEmpty)) {
      // TODO: Implement actual authentication
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Home1Page(
            username: _usernameController.text,
          ),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: AppConstants.defaultImageSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          AppConstants.defaultBorderRadius),
                      image: DecorationImage(
                        image: AssetImage(AppAssets.palestineFlag),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
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
                    textInputAction: TextInputAction.next,
                    style: AppTextStyles.bodyMedium,
                    labelStyle: AppTextStyles.label,
                    hintStyle: AppTextStyles.label,
                    errorText: _passwordError,
                  ),
                  const SizedBox(height: 16),
                  if (!widget.isLogin) ...[
                    CustomTextField(
                      controller: _confirmPasswordController,
                      label: 'Confirm Password',
                      hint: 'Confirm your password',
                      obscureText: !_isConfirmPasswordVisible,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      style: AppTextStyles.bodyMedium,
                      labelStyle: AppTextStyles.label,
                      hintStyle: AppTextStyles.label,
                      errorText: _confirmPasswordError,
                    ),
                    const SizedBox(height: 16),
                  ],
                  const SizedBox(height: 32),
                  Center(
                    child: Container(
                      width: AppConstants.defaultButtonWidth,
                      height: AppConstants.defaultButtonHeight,
                      padding: EdgeInsets.zero,
                      child: CustomButton(
                        text: widget.isLogin ? 'Login' : 'Register',
                        onPressed: _handleSubmit,
                        backgroundColor: AppColors.primary,
                        borderRadius: AppConstants.defaultBorderRadius,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.isLogin
                            ? 'Don\'t Have An Account? '
                            : 'Already have an account? ',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RegisterPage(isLogin: !widget.isLogin),
                            ),
                          );
                        },
                        child: Text(
                          widget.isLogin ? 'Register' : 'Login',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textPrimary,
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
