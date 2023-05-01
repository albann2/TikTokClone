import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
//import 'package:path/path.dart';
//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class BuildPage extends StatefulWidget {
  const BuildPage({super.key});

  @override
  State<BuildPage> createState() => _BuildPage();
}
final members = FirebaseFirestore.instance;

class _BuildPage extends State<BuildPage> {
  File? _videoFile;
  late VideoPlayerController _controller;
  final _picker = ImagePicker();
  // Future imgFromGallery() async {
  //   final pickedFile = await _picker.getVideo(source: ImageSource.gallery);
  //
  //   setState(() {
  //     if (pickedFile != null) {
  //       _video = File(pickedFile.path);
  //     } else {
  //       print('No video selected.');
  //     }
  //   });
  // }
  Future<void> saveVideoToFirestore() async {
    if (_videoFile != null) {
      final filePath = _videoFile!.path;
      try {
        // use .add() instead of .doc().set() to let Firestore automatically generate a unique ID for the document
        await members.collection('videos').add({
          'path': filePath,
          'description': 'Fun video',
        });
        print('Video added to Firestore');
      } catch (e) {
        print('Failed to add video: $e');
      }
    } else {
      print('No video selected.');
    }
  }



  Future imgFromCamera() async {
    final pickedFile = await _picker.getVideo(source: ImageSource.gallery);
    setState(() {
      _videoFile = File(pickedFile!.path);
      _controller = VideoPlayerController.file(_videoFile!);
      _controller.initialize();
      _controller.setLooping(true);
      _controller.play();
    });
  }
  Future<void> _recordVideo() async {
    final pickedFile = await _picker.getVideo(source: ImageSource.camera);
    setState(() {
      _videoFile = File(pickedFile!.path);
      _controller = VideoPlayerController.file(_videoFile!);
      _controller.initialize();
      _controller.setLooping(true);
      _controller.play();
    });
  }
  @override

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text("Video Player Demo"),
  ),
  body: _videoFile != null
  ? Center(
  child: AspectRatio(
  aspectRatio: _controller.value.aspectRatio,
  child: VideoPlayer(_controller),
  ))
      : Container(),
  floatingActionButton: Column(
  mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: "GalleryButton",
          onPressed: imgFromCamera,
          tooltip: 'Pick Video',
          child: Icon(Icons.video_library),
        ),
        SizedBox(height: 16),
        FloatingActionButton(
          heroTag: "CameraButton",
          onPressed: _recordVideo,
          tooltip: 'Take Video',
          child: Icon(Icons.videocam),
        ),
        SizedBox(height: 16),
        FloatingActionButton(
          heroTag: "SaveButton",
          onPressed: saveVideoToFirestore, // add this method
          tooltip: 'Save Video to Firestore',
          child: Icon(Icons.save),
        ),
      ],
    ),


  );
  }
}