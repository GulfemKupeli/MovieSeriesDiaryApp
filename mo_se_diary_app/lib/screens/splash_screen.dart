import 'dart:ui'; // ImageFilter için gerekli

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo_se_diary_app/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/thebear.jpg'), // Arka plan resmi
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          // Bulanıklık efekti
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color:
                Colors.black.withOpacity(0.6), // Bulanıklık üzerine koyu renk
            child: Center(
              child: Image.asset(
                'assets/images/logoW.png', // Logo resmi
                width: 200, // Logonun genişliği
                height: 200, // Logonun yüksekliği
              ),
            ),
          ),
        ),
      ),
    );
  }
}
