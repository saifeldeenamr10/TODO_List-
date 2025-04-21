import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
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
            padding: const EdgeInsets.all(24.0),
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
                          'assets/icons/page2.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 60),
                      const Text(
                        'Welcome To \n Do It !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'LexendDeca',
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF24252C),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Ready to conquer your tasks? Let's Do It together.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'LexendDeca',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6E6A7C),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80, bottom: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF149954),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0,
                            ).copyWith(
                              shadowColor:
                                  WidgetStateProperty.all(Colors.transparent),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF149954),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF149954)
                                        .withOpacity(0.5),
                                    offset: const Offset(0, 5),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'Let\'s Start',
                                  style: TextStyle(
                                    fontFamily: 'LexendDeca',
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),
                                ),
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
      ),
    );
  }
}
