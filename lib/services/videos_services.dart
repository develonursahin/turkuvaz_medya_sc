// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:haber_app/models/privates.dart';
import 'package:haber_app/models/videos_load_data.dart';

ApiModel apiModel = ApiModel();

//Dio ile fetchVideo metodunda API get işlemi yapılıp status 200 controlü yapıldı.
class VideoServices {
  static final Dio _dio = Dio();
  static Future fetchVideo() async {
    try {
      final response = await _dio.get(apiModel.videoAPI);
      if (response.statusCode == 200) {
        var result = Video.fromJson(response.data);
        return result;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
