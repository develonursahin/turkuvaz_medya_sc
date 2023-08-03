// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:haber_app/core/utils/constants/colors/color_constants.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget(
      {Key? key,
      required this.videoUrl,
      this.videoHeader,
      this.videoSpot,
      this.date,
      this.time})
      : super(key: key);
  final videoUrl;
  final videoHeader;
  final videoSpot;
  final date;
  final time;

  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstant.instance.turkuaz,
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: AspectRatio(
                      aspectRatio: 1.7777777777777777,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  color: ColorConstant.instance.acikTurkuaz,
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.replay_10, color: Colors.black),
                          onPressed: () {
                            _controller.seekTo(Duration(
                                seconds:
                                    _controller.value.position.inSeconds - 10));
                          },
                        ),
                        IconButton(
                          icon: _controller.value.isPlaying
                              ? const Icon(Icons.pause, color: Colors.black)
                              : const Icon(Icons.play_arrow,
                                  color: Colors.black),
                          onPressed: () {
                            setState(() {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                          },
                        ),
                        IconButton(
                          icon:
                              const Icon(Icons.forward_10, color: Colors.black),
                          onPressed: () {
                            _controller.seekTo(Duration(
                                seconds:
                                    _controller.value.position.inSeconds + 10));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            widget.videoHeader,
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(widget.date),
                                Text(widget.time),
                              ]),
                        ),
                      ],
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 20),
                    ),
                    Card(
                      color: ColorConstant.instance.acikTurkuaz,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          widget.videoSpot,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
