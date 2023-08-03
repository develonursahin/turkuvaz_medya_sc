import 'package:flutter/material.dart';
import 'package:haber_app/controllers/url_controller.dart';
import 'package:haber_app/core/utils/constants/colors/color_constants.dart';
import 'package:haber_app/models/news_load_data.dart';
import 'package:url_launcher/url_launcher.dart';

class C4Card extends StatelessWidget {
  const C4Card({
    super.key,
    required this.newsData,
    required this.index,
  });

  final List<Response>? newsData;
  final int index;

  @override
  Widget build(BuildContext context) {
    var lastUrl = urlController(index, newsData);
    return Container(
      constraints: const BoxConstraints(
          minHeight: 180, maxHeight: 190, minWidth: 200, maxWidth: 200),
      child: Card(
        color: ColorConstant.instance.turkuaz,
        child: Column(
          children: [
            Card(
              color: ColorConstant.instance.acikTurkuaz,
              child: InkWell(
                // ignore: sort_child_properties_last
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConstant.instance.turkuaz,
                    ),
                    child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/loader.png',
                        image: newsData![index].secondaryImage!),
                  ),
                ),
                // ignore: deprecated_member_use
                onTap: (() => launch(lastUrl!)),
              ),
            ),
            Container(
              constraints: const BoxConstraints(minHeight: 50),
              child: Card(
                child: TextButton(
                    // ignore: deprecated_member_use
                    onPressed: (() => launch(lastUrl!)),
                    child: Text(
                      newsData![index].titleShort!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
