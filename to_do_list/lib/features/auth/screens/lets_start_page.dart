import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/route_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/app_assets.dart';
import '../../../features/common_widgets/custom_button.dart';
import 'register_page.dart';
import 'splash_screen.dart';

class LetsStartPage extends StatelessWidget {
  const LetsStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const SplashScreen(),
              ),
              (route) => false,
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom -
                    kToolbarHeight -
                    48,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 250,
                        child: SvgPicture.asset(
                          AppAssets.page2,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 60),
                      Text(
                        'Welcome To \n Do It !',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.headingLarge,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Ready to conquer your tasks? Let's Do It together.",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyLarge,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80, bottom: 20),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            width: AppConstants.defaultButtonWidth,
                            height: AppConstants.defaultButtonHeight,
                            padding: EdgeInsets.zero,
                            child: CustomButton(
                              text: 'Let\'s Start',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                );
                              },
                              backgroundColor: AppColors.primary,
                              borderRadius: AppConstants.defaultBorderRadius,
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
      ),
    );
  }
}
