import 'package:flutter/material.dart';
import 'package:gellary_walt/Utils.dart';
import 'package:get/get.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 20),
              child: Text(
                'Calculator Lock',
                style: SafeGoogleFont(
                  'Nexa',
                  fontSize: Get.height / 30,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
