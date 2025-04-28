import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orix_food/core/theme/app_colors.dart';
import 'package:orix_food/widgets/login&registration_widget.dart';
import 'package:orix_food/widgets/login_widget.dart';

import '../widgets/registration_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoginSelected = true; // true = Login, false = Registration
  late final Future<LottieComposition> _lottieCompositionFuture;

  @override
  void initState() {
    super.initState();
    _lottieCompositionFuture =
        AssetLottie('assets/animations/AnimationSlash.json').load();
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
                FutureBuilder<LottieComposition>(
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
                      child: LoginregistrationWidget(
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
                      child: LoginregistrationWidget(
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
