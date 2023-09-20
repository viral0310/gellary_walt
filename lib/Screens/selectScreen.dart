import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gellary_walt/Utils.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final List<Map<String, dynamic>> cardData = [
    {
      'icon': 'assets/images/image.png',
      'title': 'Photos',
      'navigator': '/MyHomePage',
    },
    {
      'icon': 'assets/images/file.png',
      'title': 'Files',
      'navigator': '',
    },
    {
      'icon': 'assets/images/video.png',
      'title': 'Videos',
      'navigator': '',
    },
    {
      'icon': 'assets/images/Group 51.png',
      'title': 'Downloads',
      'navigator': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'File Manager',
          style: TextStyle(color: Colors.white),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const BackButtonIcon(),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cardData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(cardData[index]['navigator']);
                      },
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
                          borderRadius: BorderRadius.circular(10),
                        ),
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
                                    color: Colors.white,
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
                              ),
                            ],
                          ),
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
      floatingActionButton: GradientFAB(
        onPressed: () {},
      ),
    );
  }
}

class GradientFAB extends StatelessWidget {
  final VoidCallback onPressed;

  GradientFAB({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: RawMaterialButton(
        onPressed: onPressed,
        elevation: 2.0,
        fillColor: Colors.transparent, // Set the FAB color to transparent
        shape: const CircleBorder(),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xffF2A501),
                Color(0xffFF7E00)
              ], // Define your gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(28.0),
          ),
          child: const Center(
            child: Icon(
              CupertinoIcons.plus,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
      ),
    );
  }
}
