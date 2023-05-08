import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

//import '../../util/button.dart';

class VideoPlayerComponent extends StatefulWidget {
  final String media;
  final String category;
  final String description;
  final int nombreLike;
  const VideoPlayerComponent(
      {super.key,
      required this.media,
      required this.category,
      required this.description,
      required this.nombreLike});

  @override
  State<VideoPlayerComponent> createState() => _VideoPlayerComponentState();
}

class _VideoPlayerComponentState extends State<VideoPlayerComponent> {
  late VideoPlayerController _controller;
  late int count;
  bool isLike = false;
  late String description = 'aucune';
  // static int get nombreLike => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = widget.nombreLike;
    description = widget.description;
    _controller = VideoPlayerController.network(
      widget.media,
    )..initialize().then((_) {
        setState(() {});

        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _controller.value.isInitialized
            ? SizedBox(
                // width: _controller.value.size.width,
                // height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              )
            : Container(),
        Positioned(
          bottom: 30.0,
          left: 0.0,
          right: 90.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "@Mitoumba",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(description,
                  style: const TextStyle(
                    color: Colors.white,
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            alignment: Alignment(1, 1),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              IconButton(
                  onPressed: () {
                    isLike
                        ? setState(() {
                            isLike = false;
                            count--;
                          })
                        : setState(() {
                            isLike = true;
                            count++;
                          });
                  },
                  icon: Icon(Icons.favorite,
                      color: isLike ? Colors.red : Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text('$count'),
              IconButton(
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  icon: Icon(Icons.chat_bubble_outline)),
              SizedBox(
                height: 10,
              ),
              Text('0')
            ]),
          ),
        )
      ],
    );
  }
}
