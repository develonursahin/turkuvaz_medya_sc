import 'package:flutter/material.dart';
import 'package:haber_app/controllers/url_controller.dart';
import 'package:haber_app/core/utils/constants/colors/color_constants.dart';
import 'package:haber_app/models/news_load_data.dart';
import 'package:haber_app/models/privates.dart';
import 'package:url_launcher/url_launcher.dart';

PrivateData privateData = PrivateData();

class ACard extends StatelessWidget {
  const ACard({
    super.key,
    required this.newsData,
    required this.index,
  });

  final int index;
  final List<Response>? newsData;

  @override
  Widget build(BuildContext context) {
    var lastUrl = urlController(index, newsData);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: const BoxConstraints(
            maxHeight: 330, minHeight: 330, maxWidth: 200, minWidth: 200),
        child: Card(
          color: Colors.white,
          child: Card(
            color: ColorConstant.instance.turkuaz,
            child: Column(
              children: [
                Card(
                  color: ColorConstant.instance.acikTurkuaz,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.network(privateData.brandLogo),
                      ),
                      InkWell(
                        // ignore: sort_child_properties_last
                        child: Card(
                          child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/loader.png',
                              image: newsData![index].secondaryImage!),
                        ),
                        // ignore: deprecated_member_use
                        onTap: (() => launch(lastUrl!)),
                      ),
                    ],
                  ),
                ),

                // ignore: prefer_const_constructors
                Card(
                  color: Colors.white,
                  child: Container(
                    constraints: const BoxConstraints(
                        minHeight: 120,
                        maxHeight: 120,
                        minWidth: 230,
                        maxWidth: 230),
                    child: TextButton(
                        // ignore: deprecated_member_use
                        onPressed: (() => launch(lastUrl!)),
                        child: Text(
                          // ignore: unnecessary_null_comparison
                          newsData![index].titleShort! != null
                              ? newsData![index].titleShort!.toUpperCase()
                              : newsData![index].title!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
