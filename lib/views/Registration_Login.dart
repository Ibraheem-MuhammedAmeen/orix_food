import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orix_food/core/theme/app_colors.dart';
import 'package:orix_food/widgets/displayName_widget.dart';
import 'package:orix_food/widgets/login_widget.dart';

import '../widgets/registration_widget.dart';

class LoginRegistration_Screen extends StatefulWidget {
  const LoginRegistration_Screen({super.key});

  @override
  State<LoginRegistration_Screen> createState() =>
      _LoginRegistration_ScreenState();
}

class _LoginRegistration_ScreenState extends State<LoginRegistration_Screen> {
  bool isLoginSelected = true; // true = Login, false = Registration
  late final Future<LottieComposition> _lottieCompositionFuture;

  @override
  void initState() {
    super.initState();
    _lottieCompositionFuture =
        AssetLottie('assets/animations/Animation_Delivery.json').load();
  }

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
                Hero(
                  tag: 'splash_to_home',
                  child: FutureBuilder<LottieComposition>(
                    future: _lottieCompositionFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Lottie(
                          composition: snapshot.data!,
                          width: 350,
                          height: 250,
                          fit: BoxFit.contain,
                        );
                      } else {
                        return const SizedBox(
                          height: 250,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                    },
                  ),
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
                      child: DisplayNameWidget(
                        title: 'Login',
                        isLoginSelected: isLoginSelected == true,
                      ),
                    ),
                    const SizedBox(width: 90),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isLoginSelected = false;
                        });
                      },
                      child: DisplayNameWidget(
                        title: 'Registration',
                        isLoginSelected: isLoginSelected == false,
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
