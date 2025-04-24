import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/app_assets.dart';
import 'update_profile_page.dart';
import 'change_password_page.dart';
import 'language_page.dart';

class ProfileSettingsPage extends StatelessWidget {
  final String username;

  const ProfileSettingsPage({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage(AppAssets.palestineFlag),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hello!',
                            style: TextStyle(
                              fontFamily: 'LexendDeca',
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              height: 1.0,
                              letterSpacing: 0,
                              color: Color(0xFF24252C),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            username,
                            style: const TextStyle(
                              fontFamily: 'LexendDeca',
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              height: 1.0,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Settings Options
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 331,
                        height: 63,
                        child: _buildSettingsButton(
                          context,
                          'Update Profile',
                          'assets/icons/Profile - Iconly Pro.svg',
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateProfilePage(
                                currentUsername: username,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 331,
                        height: 63,
                        child: _buildSettingsButton(
                          context,
                          'Change Password',
                          'assets/icons/Lock - Iconly Pro.svg',
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangePasswordPage(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 331,
                        height: 63,
                        child: _buildSettingsButton(
                          context,
                          'Settings',
                          'assets/icons/Setting - Iconly Pro.svg',
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LanguagePage(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsButton(
    BuildContext context,
    String title,
    String iconPath,
    VoidCallback onTap,
  ) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              SvgPicture.asset(
                iconPath,
                width: 24,
                height: 24,
                color: Colors.black87,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'LexendDeca',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                    letterSpacing: 0,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.black54),
            ],
          ),
        ),
      ),
    );
  }
}
