import 'package:flutter/material.dart';
import 'package:haber_app/controllers/url_controller.dart';
import 'package:haber_app/core/utils/constants/colors/color_constants.dart';
import 'package:haber_app/models/news_load_data.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.newsData,
    required this.index,
    required this.width,
    required this.height,
    required this.color,
  });

  final List<Response>? newsData;
  final int index;
  final double width;
  final double height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    var lastUrl = urlController(index, newsData);
    return Card(
      color: color,
      child: Card(
        color: ColorConstant.instance.turkuaz,
        child: Card(
          color: ColorConstant.instance.acikTurkuaz,
          child: Column(
            children: [
              InkWell(
                // ignore: sort_child_properties_last
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    constraints: BoxConstraints(
                        minHeight: height,
                        maxHeight: height,
                        minWidth: width,
                        maxWidth: width),
                    decoration: BoxDecoration(
                      color: ColorConstant.instance.acikTurkuaz,
                    ),
                    child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/loader.png',
                        image: newsData![index].secondaryImage!),
                  ),
                ),
                // ignore: deprecated_member_use
                onTap: (() => launch(lastUrl!)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
