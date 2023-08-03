// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:haber_app/models/privates.dart';
import 'package:haber_app/models/news_ticker_load_data.dart';

ApiModel apiModel = ApiModel();

//Dio ile fetchNewsTicker metodunda API get işlemi yapılıp status 200 controlü yapıldı.
class NewsTickerServices {
  static final Dio _dio = Dio();
  static Future fetchNewsTicker() async {
    try {
      final response = await _dio.get(apiModel.newsTickerAPI);
      if (response.statusCode == 200) {
        var result = NewsTicker.fromJson(response.data);
        return result;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
