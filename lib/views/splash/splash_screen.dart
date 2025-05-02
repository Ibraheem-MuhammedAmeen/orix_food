import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:orix_food/core/theme/app_colors.dart';
import 'package:orix_food/views/Registration_Login.dart';
import 'package:ionicons/ionicons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final Future<LottieComposition> _lottieCompositionFuture;
  @override
  void initState() {
    super.initState();
    _lottieCompositionFuture =
        AssetLottie('assets/animations/AnimationSlash.json').load();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginRegistration_Screen()),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Hero(
              tag: 'splash_to_home',
              child: Text(
                'Orix Food',
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 30,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
