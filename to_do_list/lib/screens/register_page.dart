import 'package:flutter/material.dart';
import 'home1_page.dart';

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
  final bool _isPasswordVisible = false;
  final bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
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
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
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
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/palestine_flag.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    widget.isLogin ? '' : '',
                    style: const TextStyle(
                      fontFamily: 'LexendDeca',
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                      height: 1.0,
                      letterSpacing: 0,
                      color: Color(0xFF6E6A7C),
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _usernameController,
                    style: const TextStyle(
                      fontFamily: 'LexendDeca',
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                      height: 1.0,
                      letterSpacing: 0,
                      color: Color(0xFF6E6A7C),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: const TextStyle(
                        fontFamily: 'LexendDeca',
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                        height: 1.0,
                        letterSpacing: 0,
                        color: Color(0xFF6E6A7C),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0xFF2F9E44),
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    style: const TextStyle(
                      fontFamily: 'LexendDeca',
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                      height: 1.0,
                      letterSpacing: 0,
                      color: Color(0xFF6E6A7C),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        fontFamily: 'LexendDeca',
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                        height: 1.0,
                        letterSpacing: 0,
                        color: Color(0xFF6E6A7C),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0xFF2F9E44),
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  if (!widget.isLogin) ...[
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: !_isConfirmPasswordVisible,
                      style: const TextStyle(
                        fontFamily: 'LexendDeca',
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                        height: 1.0,
                        letterSpacing: 0,
                        color: Color(0xFF6E6A7C),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: const TextStyle(
                          fontFamily: 'LexendDeca',
                          fontWeight: FontWeight.w200,
                          fontSize: 14,
                          height: 1.0,
                          letterSpacing: 0,
                          color: Color(0xFF6E6A7C),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Color(0xFF2F9E44),
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                  const SizedBox(height: 32),
                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _handleSubmit,
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
                              color: const Color(0xFF149954).withOpacity(0.5),
                              offset: const Offset(0, 5),
                              blurRadius: 10,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            widget.isLogin ? 'Login' : 'Register',
                            style: const TextStyle(
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
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.isLogin
                            ? 'Don\'t Have An Account? '
                            : 'Already have an account? ',
                        style: const TextStyle(
                          fontFamily: 'LexendDeca',
                          color: Colors.grey,
                        ),
                      ),
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
                          style: const TextStyle(
                            fontFamily: 'LexendDeca',
                            color: Colors.black,
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
