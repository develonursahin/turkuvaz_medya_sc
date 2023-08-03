// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:haber_app/models/privates.dart';

PrivateData privateBrand = PrivateData();

videoUrlController(index, videoData) {
  //Haberlerin bulunduğu Urller kararsızdır.
  //Bazılarında websitenin kaynağı belirtilmişken bazılarında belirtilmemiştir.
  //Kaynağı bulunmayan Urllere kaynağı eklenmiştir.
  var lastUrl;
  var newUrl =
      videoData![index].url; //API'den gelen url, lastUrl değişkenine atılır.
  var source = videoData![index]
      .source; //API'den gelen source, source değişkenine atılır.
  newUrl ??= "";
  source ??= privateBrand.brandName;
  var controlledUrl = newUrl.indexOf(
      source); //lastUrl'in içerisinde source olup olmadığı kontrol edilir.
  if (controlledUrl == -1) {
    //lastUrl'in içerisinde source yoksa başına eklenir.
    lastUrl = "https://www.$source$newUrl";
    return lastUrl;
  } else {
    lastUrl = newUrl;
    return lastUrl;
  }
}
