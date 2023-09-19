import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gellary_walt/Screens/SplashScreen.dart';
import 'package:gellary_walt/Screens/gallary_screen.dart';
import 'package:get/get.dart';
import 'package:gellary_walt/Screens/OnBording.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/OnBording': (context) => const FlashScreen(),
        '/MyHomePage': (context) => MyApp(),
      },
    ),
  );
}
