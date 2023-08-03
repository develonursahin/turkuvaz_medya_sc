import 'package:flutter/material.dart';
import 'package:haber_app/controllers/video_url_controller.dart';
import 'package:haber_app/core/utils/constants/colors/color_constants.dart';
import 'package:haber_app/models/videos_load_data.dart';
import 'package:url_launcher/url_launcher.dart';

class F1Card extends StatelessWidget {
  const F1Card({
    super.key,
    required this.videoData,
    required this.index,
  });

  final List<Response>? videoData;
  final int index;

  @override
  Widget build(BuildContext context) {
    var lastUrl = videoUrlController(index, videoData);
    return InkWell(
      // ignore: sort_child_properties_last
      child: Container(
          decoration: BoxDecoration(
            color: ColorConstant.instance.acikTurkuaz,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ColorConstant.instance.turkuaz, width: 4),
          ),
          child: Card(
            child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loader.png',
                image: videoData![index].categoryName!),
          )),
      // ignore: deprecated_member_use
      onTap: (() => launch(lastUrl!)),
    );
  }
}
