import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orix_food/core/theme/app_colors.dart';
import 'package:orix_food/widgets/login_widget.dart';

import '../widgets/registration_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoginSelected = true; // true = Login, false = Registration

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/animations/AnimationSlash.json',
                  width: 350,
                  height: 250,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isLoginSelected = true;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight:
                                  isLoginSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                              color:
                                  isLoginSelected
                                      ? Colors.white70
                                      : Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 2,
                            width: 50,
                            color:
                                isLoginSelected
                                    ? AppColors.secondary
                                    : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 90),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isLoginSelected = false;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            'Registration',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight:
                                  !isLoginSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                              color:
                                  !isLoginSelected
                                      ? Colors.white70
                                      : Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 2,
                            width: 90,
                            color:
                                !isLoginSelected
                                    ? AppColors.secondary
                                    : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Show Widget Below Based on Selection
                isLoginSelected ? LoginWidget() : RegistrationWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
