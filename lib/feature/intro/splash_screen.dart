import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:presensi_mobile/feature/intro/intro_screen.dart';

import '../../utils/fonts_constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _getThingsOnStartup(context);
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Student App",
                style: TextStyle(
                    fontSize: 30, color: Colors.white, fontFamily: 'Miliard')),
            Lottie.asset('assets/animation/school.json', repeat: false),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("version 1.0.0",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                      fontFamily: FontMiliard)),
            ),
          ],
        ),
      ),
    );
  }

  Future _getThingsOnStartup(context) async {
    Future.delayed(const Duration(seconds: 2), () {
      // ignore: avoid_print
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const IntroScreen()),
      );
    });
  }
}
