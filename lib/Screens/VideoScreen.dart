// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;

  List<FileSystemEntity> _files = [];

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('');
    _getVideoFiles();
  }

  Future<void> _getVideoFiles() async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      List<FileSystemEntity> files = directory
          .listSync()
          .where((entity) => entity.path.endsWith('.mp4'))
          .toList();
      setState(() {
        _files = files;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading video files: $e');
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Videos',
          style: TextStyle(color: Colors.white),
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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
        ),
        itemCount: _files.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _initializeAndPlayVideo(_files[index]);
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.video_library,
                    size: 50,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    basename(_files[index].path),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _initializeAndPlayVideo(FileSystemEntity file) async {
    if (_controller.value.isInitialized) {
      await _controller.pause();
      await _controller.seekTo(const Duration(seconds: 0));
    } else {
      _controller = VideoPlayerController.file(
        File(file.path),
      );
      await _controller.initialize();
    }

    await _controller.play();
    setState(() {});
  }
}
