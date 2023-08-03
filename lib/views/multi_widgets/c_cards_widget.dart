import 'package:flutter/material.dart';
import 'package:haber_app/models/news_load_data.dart';
import 'package:haber_app/views/widgets/c4_card_widget.dart';

class CCards extends StatelessWidget {
  const CCards({
    super.key,
    required this.newsData,
  });

  final List<Response>? newsData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          C4Card(
            newsData: newsData,
            index: 3,
          ),
          C4Card(
            newsData: newsData,
            index: 4,
          ),
          C4Card(
            newsData: newsData,
            index: 5,
          ),
          C4Card(
            newsData: newsData,
            index: 6,
          ),
        ],
      ),
    );
  }
}
