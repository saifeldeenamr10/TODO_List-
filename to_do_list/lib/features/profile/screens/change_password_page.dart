import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/app_assets.dart';
import '../../../features/common_widgets/custom_button.dart';
import '../../../features/common_widgets/custom_text_field.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isOldPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String? _oldPasswordError;
  String? _newPasswordError;
  String? _confirmPasswordError;

  @override
  void initState() {
    super.initState();
    _oldPasswordController.addListener(_onOldPasswordChanged);
    _newPasswordController.addListener(_onNewPasswordChanged);
    _confirmPasswordController.addListener(_onConfirmPasswordChanged);
  }

  void _onOldPasswordChanged() {
    if (_oldPasswordController.text.isNotEmpty) {
      setState(() {
        _oldPasswordError = null;
      });
    }
  }

  void _onNewPasswordChanged() {
    if (_newPasswordController.text.isNotEmpty) {
      setState(() {
        _newPasswordError = null;
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
    _oldPasswordController.removeListener(_onOldPasswordChanged);
    _newPasswordController.removeListener(_onNewPasswordChanged);
    _confirmPasswordController.removeListener(_onConfirmPasswordChanged);
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSave() {
    setState(() {
      _oldPasswordError = _oldPasswordController.text.isEmpty
          ? 'Please enter your old password'
          : null;
      _newPasswordError = _newPasswordController.text.isEmpty
          ? 'Please enter a new password'
          : _newPasswordController.text.length < 6
              ? 'Password must be at least 6 characters'
              : null;
      _confirmPasswordError = _confirmPasswordController.text.isEmpty
          ? 'Please confirm your new password'
          : _confirmPasswordController.text != _newPasswordController.text
              ? 'Passwords do not match'
              : null;
    });

    if (_oldPasswordController.text.isNotEmpty &&
        _newPasswordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        _newPasswordController.text.length >= 6 &&
        _confirmPasswordController.text == _newPasswordController.text) {
      // TODO: Implement actual password change logic

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Password changed successfully!',
            style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
          ),
          backgroundColor: AppColors.primary,
        ),
      );

      // Return to previous screen
      Navigator.pop(context);
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
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Change Password',
          style: AppTextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Palestine Flag Image
                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/palestine_flag.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Old Password Input
                  CustomTextField(
                    controller: _oldPasswordController,
                    label: 'Old Password',
                    hint: 'Enter your old password',
                    obscureText: !_isOldPasswordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    style: AppTextStyles.bodyMedium,
                    labelStyle: AppTextStyles.label,
                    hintStyle: AppTextStyles.label,
                    errorText: _oldPasswordError,
                  ),
                  const SizedBox(height: 16),

                  // New Password Input
                  CustomTextField(
                    controller: _newPasswordController,
                    label: 'New Password',
                    hint: 'Enter your new password',
                    obscureText: !_isNewPasswordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    style: AppTextStyles.bodyMedium,
                    labelStyle: AppTextStyles.label,
                    hintStyle: AppTextStyles.label,
                    errorText: _newPasswordError,
                  ),
                  const SizedBox(height: 16),

                  // Confirm Password Input
                  CustomTextField(
                    controller: _confirmPasswordController,
                    label: 'Confirm New Password',
                    hint: 'Confirm your new password',
                    obscureText: !_isConfirmPasswordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    style: AppTextStyles.bodyMedium,
                    labelStyle: AppTextStyles.label,
                    hintStyle: AppTextStyles.label,
                    errorText: _confirmPasswordError,
                  ),
                  const SizedBox(height: 32),

                  // Save Button
                  SizedBox(
                    height: 56,
                    child: CustomButton(
                      text: 'Save Changes',
                      onPressed: _handleSave,
                      backgroundColor: AppColors.primary,
                      borderRadius: 16,
                    ),
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
