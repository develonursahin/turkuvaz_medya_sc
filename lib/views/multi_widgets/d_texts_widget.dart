import 'package:flutter/material.dart';
import 'package:haber_app/core/utils/constants/colors/color_constants.dart';
import 'package:haber_app/models/news_load_data.dart';
import 'package:haber_app/views/widgets/d5_text_widget.dart';
import 'package:haber_app/views/widgets/d6_text_widget.dart';

class DTexts extends StatelessWidget {
  const DTexts({
    super.key,
    required this.newsData,
  });

  final List<Response>? newsData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: ColorConstant.instance.turkuaz,
          child: Column(
            children: [
              D5Text(
                newsData: newsData,
                index: 7,
              ),
              D5Text(
                newsData: newsData,
                index: 8,
              ),
              D5Text(
                newsData: newsData,
                index: 9,
              ),
            ],
          ),
        ),
        D6Text(newsData: newsData, index: 10),
      ],
    );
  }
}
