import 'package:flutter/material.dart';
import 'package:gellary_walt/Utils.dart';
import 'package:get/get.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  final List<Map<String, dynamic>> cardData = [
    {
      'icon': 'assets/images/logo.png',
      'title': 'Begin the Application',
    },
    {
      'icon': 'assets/images/star.png',
      'title': 'Give us a Rating',
    },
    {
      'icon': 'assets/images/Icon.png',
      'title': 'Privacy Policy',
    },
    {
      'icon': 'assets/images/Vector.png',
      'title': 'Invite Friends',
    },
    {
      'icon': 'assets/images/more.png',
      'title': 'More Application',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 20),
              child: Text(
                textAlign: TextAlign.start,
                'Calculator Lock',
                style: SafeGoogleFont(
                  'Nexa',
                  fontSize: Get.height / 30,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cardData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Container(
                      width: Get.width,
                      height: Get.height / 16,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Colors.white54.withOpacity(0.1),
                              Colors.white24.withOpacity(0.1),
                              Colors.white54.withOpacity(0.1),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                              offset: const Offset(02, 02),
                              blurRadius: 3,
                              spreadRadius: 1,
                              blurStyle: BlurStyle.inner,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  cardData[index]['icon'],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              cardData[index]['title'],
                              style: SafeGoogleFont(
                                'Nexa',
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffffffff),
                              ),
                            ), // Fix this line
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
