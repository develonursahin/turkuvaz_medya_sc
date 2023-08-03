// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:haber_app/models/privates.dart';
import 'package:haber_app/models/news_load_data.dart';

ApiModel apiModel = ApiModel();

//Dio ile fetchNews metodunda API get işlemi yapılıp status 200 controlü yapıldı.
class NewsServices {
  static final Dio _dio = Dio();
  static Future fetchNews() async {
    try {
      final response = await _dio.get(apiModel.newsAPI);
      if (response.statusCode == 200) {
        var result = News.fromJson(response.data);
        return result;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
