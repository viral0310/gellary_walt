import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gellary_walt/Utils.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/OnBording');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Image.asset(
              'assets/images/logo.png',
              height: Get.height / 4,
              width: Get.width / 2,
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              'Calculator Lock',
              style: SafeGoogleFont(
                'Nexa',
                fontSize: Get.height / 30,
                fontWeight: FontWeight.w700,
                color: const Color(0xffffffff),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
