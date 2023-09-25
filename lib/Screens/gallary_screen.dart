import 'dart:io';
import 'package:all_gallery_images/model/StorageImages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:all_gallery_images/all_gallery_images.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StorageImages? _storageImages;

  @override
  void initState() {
    super.initState();
    if (_storageImages == null) {
      getImagesFromGallery();
    }
  }

  Future<void> getImagesFromGallery() async {
    StorageImages? storageImages;
    try {
      storageImages = await GalleryImages().getStorageImages();
    } catch (error) {
      debugPrint(error.toString());
    }

    if (!mounted) return;

    setState(() {
      _storageImages = storageImages;
    });
  }

  void clearImages() {
    setState(() {
      _storageImages = null;
      if (kDebugMode) {
        print(_storageImages.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("fari thi tahyu...");
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Photos',
          style: TextStyle(color: Colors.white),
        ),
        leading: InkWell(
          onTap: () {
            clearImages();
            Navigator.of(context).pop();
          },
          child: const BackButtonIcon(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 92,
                height: 84,
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff060606),
                      Color(0xff13171A),
                    ],
                    begin: Alignment.center,
                    end: Alignment.center,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Select',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: Get.height / 45,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: _storageImages != null
          ? GridView.builder(
              itemCount: _storageImages!.images!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: FileImage(
                              File(_storageImages!.images![index].imagePath!),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: const Alignment(0, -1),
                            end: const Alignment(1, 1),
                            colors: <Color>[
                              Colors.transparent,
                              Colors.black.withOpacity(0.85)
                            ],
                            stops: const <double>[0, 1],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(
                color: Color(0xffFF7E00),
              ),
            ),
    );
  }
}
