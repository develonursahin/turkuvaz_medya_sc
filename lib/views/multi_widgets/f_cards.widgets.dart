import 'package:flutter/material.dart';
import 'package:haber_app/core/utils/constants/colors/color_constants.dart';
import 'package:haber_app/models/news_load_data.dart';
import 'package:haber_app/views/widgets/image_card_widget.dart';

class FCards extends StatelessWidget {
  const FCards({
    super.key,
    required this.newsData,
  });

  final List<Response>? newsData;

  @override
  Widget build(BuildContext context) {
    double width = 150;
    double height = 93;
    return Column(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                6,
                (index) => ImageCard(
                    newsData: newsData,
                    index: index + 11,
                    width: width,
                    height: height,
                    color: ColorConstant.instance.turkuaz)),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                6,
                (index) => ImageCard(
                    newsData: newsData,
                    index: index + 17,
                    width: width,
                    height: height,
                    color: ColorConstant.instance.turkuaz)),
          ),
        ),
      ],
    );
  }
}
