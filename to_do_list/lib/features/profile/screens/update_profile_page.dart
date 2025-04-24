import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/app_assets.dart';
import '../../../features/common_widgets/custom_button.dart';
import '../../../features/common_widgets/custom_text_field.dart';

class UpdateProfilePage extends StatefulWidget {
  final String currentUsername;

  const UpdateProfilePage({
    super.key,
    required this.currentUsername,
  });

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _usernameController;
  String? _usernameError;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.currentUsername);
    _usernameController.addListener(_onUsernameChanged);
  }

  void _onUsernameChanged() {
    if (_usernameController.text.isNotEmpty) {
      setState(() {
        _usernameError = null;
      });
    }
  }

  @override
  void dispose() {
    _usernameController.removeListener(_onUsernameChanged);
    _usernameController.dispose();
    super.dispose();
  }

  void _handleUpdate() {
    setState(() {
      _usernameError =
          _usernameController.text.isEmpty ? 'Username is required' : null;
    });

    if (_usernameController.text.isNotEmpty) {
      // TODO: Implement actual update logic

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Profile updated successfully!',
            style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
          ),
          backgroundColor: AppColors.primary,
        ),
      );

      // Return the new username to the previous screen
      Navigator.pop(context, _usernameController.text);
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
          'Update Profile',
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
                  // Profile Image
                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(AppAssets.palestineFlag),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Username Input
                  CustomTextField(
                    controller: _usernameController,
                    label: 'Username',
                    hint: 'Enter your username',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    style: AppTextStyles.bodyMedium,
                    labelStyle: AppTextStyles.label,
                    hintStyle: AppTextStyles.label,
                    errorText: _usernameError,
                  ),
                  const SizedBox(height: 32),

                  // Update Button
                  Center(
                    child: Container(
                      width: 331,
                      height: 48.01,
                      padding: EdgeInsets.zero,
                      child: CustomButton(
                        text: 'Update',
                        onPressed: _handleUpdate,
                        backgroundColor: AppColors.primary,
                        borderRadius: 14,
                      ),
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
