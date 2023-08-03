// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class NewsTickerWidget extends StatefulWidget {
  final List<String> newsList;

  const NewsTickerWidget({Key? key, required this.newsList}) : super(key: key);

  @override
  _NewsTickerWidgetState createState() => _NewsTickerWidgetState();
}

class _NewsTickerWidgetState extends State<NewsTickerWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final double _scrollSpeed = 20.0;
  late int _currentNewsIndex;

  @override
  void initState() {
    super.initState();
    _currentNewsIndex = 0;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _currentNewsIndex =
                (_currentNewsIndex + 1) % widget.newsList.length;
            _animationController.reset();
            _animationController.forward();
          });
        }
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[800],
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'SON DAKİKA',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Stack(
                    children: [
                      Positioned(
                        left: -_scrollSpeed *
                            _animationController.value *
                            widget.newsList[_currentNewsIndex].length,
                        child: Text(
                          widget.newsList[_currentNewsIndex],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: (1 - _animationController.value) *
                            MediaQuery.of(context).size.width,
                        child: Text(
                          widget.newsList[(_currentNewsIndex + 1) %
                              (widget.newsList.length)],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          const Icon(
            Icons.language,
            color: Colors.white,
            size: 24.0,
          ),
        ],
      ),
    );
  }
}
