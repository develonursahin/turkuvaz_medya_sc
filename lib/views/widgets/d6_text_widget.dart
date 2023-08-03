import 'package:flutter/material.dart';
import 'package:haber_app/controllers/url_controller.dart';
import 'package:haber_app/core/utils/constants/colors/color_constants.dart';
import 'package:haber_app/models/news_load_data.dart';
import 'package:url_launcher/url_launcher.dart';

class D6Text extends StatelessWidget {
  const D6Text({
    super.key,
    required this.newsData,
    required this.index,
  });

  final int index;
  final List<Response>? newsData;

  @override
  Widget build(BuildContext context) {
    var lastUrl = urlController(index, newsData);
    return Card(
      color: ColorConstant.instance.turkuaz,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
            // ignore: deprecated_member_use
            onPressed: (() => launch(lastUrl!)),
            child: Text(
              newsData![index].spot!,
              style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Colors.white),
            )),
      ),
    );
  }
}
