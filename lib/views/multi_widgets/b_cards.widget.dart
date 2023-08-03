import 'package:flutter/material.dart';
import 'package:haber_app/models/news_load_data.dart';
import 'package:haber_app/views/widgets/image_card_widget.dart';

class BCards extends StatelessWidget {
  const BCards({
    super.key,
    required this.newsData,
  });

  final List<Response>? newsData;

  @override
  Widget build(BuildContext context) {
    double width = 400;
    double height = 133;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImageCard(
                newsData: newsData,
                index: 1,
                width: width,
                height: height,
                color: Colors.white),
            const SizedBox(height: 15),
            ImageCard(
                width: width,
                newsData: newsData,
                index: 2,
                height: height,
                color: Colors.white),
          ],
        ),
      ),
    );
  }
}
