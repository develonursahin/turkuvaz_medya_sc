// ignore_for_file: unnecessary_question_mark, prefer_void_to_null

import 'package:haber_app/models/base_model_abstract_class.dart';

//Json to Dart ile News Model oluşturuldu. BaseModelden extend edildi.
class News extends BaseModel {
  Meta? meta;
  Data? data;

  News({this.meta, this.data});

  News.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Meta {
  int? statusCode;
  String? message;
  String? description;
  String? brand;

  Meta({this.statusCode, this.message, this.description, this.brand});

  Meta.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    description = json['description'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['message'] = message;
    data['description'] = description;
    data['brand'] = brand;
    return data;
  }
}

class Data {
  Articles? articles;

  Data({this.articles});

  Data.fromJson(Map<String, dynamic> json) {
    articles =
        json['articles'] != null ? Articles.fromJson(json['articles']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (articles != null) {
      data['articles'] = articles!.toJson();
    }
    return data;
  }
}

class Articles {
  List<Response>? response;
  bool? status;

  Articles({this.response, this.status});

  Articles.fromJson(Map<String, dynamic> json) {
    if (json['Response'] != null) {
      response = <Response>[];
      json['Response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['Response'] = response!.map((v) => v.toJson()).toList();
    }
    data['Status'] = status;
    return data;
  }
}

class Response {
  String? articleId;
  String? articleSourceId;
  List<ArticleSourceInfo>? articleSourceInfo;
  String? articleSourceType;
  String? articleType;
  bool? canUserWriteComments;
  String? categoryId;
  String? categoryName;
  String? createdDate;
  int? createdDateInt;
  String? createdDateReal;
  String? createdUser;
  String? description;
  List<Null>? descriptionList;
  Null? detailCounterScript;
  String? external;
  Null? haberVideo;
  bool? hideArticleRightColumn;
  String? id;
  int? identityId;
  bool? isModified;
  Null? listCounterScript;
  String? modifiedDate;
  String? nameForUrl;
  String? nameForUrl2;
  String? outputDate;
  String? primaryImage;
  String? primaryImageAlternateText;
  int? quickImageType;
  String? secondaryImage;
  String? secondaryImageAlternateText;
  bool? showWebView;
  int? sortOrderCurrent;
  String? source;
  String? spot;
  String? spotShort;
  bool? surmansetBaslik;
  bool? surmansetBaslikKategori;
  String? title;
  String? titleShort;
  String? url;
  bool? usedMethod;

  Response(
      {this.articleId,
      this.articleSourceId,
      this.articleSourceInfo,
      this.articleSourceType,
      this.articleType,
      this.canUserWriteComments,
      this.categoryId,
      this.categoryName,
      this.createdDate,
      this.createdDateInt,
      this.createdDateReal,
      this.createdUser,
      this.description,
      this.descriptionList,
      this.detailCounterScript,
      this.external,
      this.haberVideo,
      this.hideArticleRightColumn,
      this.id,
      this.identityId,
      this.isModified,
      this.listCounterScript,
      this.modifiedDate,
      this.nameForUrl,
      this.nameForUrl2,
      this.outputDate,
      this.primaryImage,
      this.primaryImageAlternateText,
      this.quickImageType,
      this.secondaryImage,
      this.secondaryImageAlternateText,
      this.showWebView,
      this.sortOrderCurrent,
      this.source,
      this.spot,
      this.spotShort,
      this.surmansetBaslik,
      this.surmansetBaslikKategori,
      this.title,
      this.titleShort,
      this.url,
      this.usedMethod});

  Response.fromJson(Map<String, dynamic> json) {
    articleId = json['ArticleId'];
    articleSourceId = json['ArticleSourceId'];
    if (json['ArticleSourceInfo'] != null) {
      articleSourceInfo = <ArticleSourceInfo>[];
      json['ArticleSourceInfo'].forEach((v) {
        articleSourceInfo!.add(ArticleSourceInfo.fromJson(v));
      });
    }
    articleSourceType = json['ArticleSourceType'];
    articleType = json['ArticleType'];
    canUserWriteComments = json['CanUserWriteComments'];
    categoryId = json['CategoryId'];
    categoryName = json['CategoryName'];
    createdDate = json['CreatedDate'];
    createdDateInt = json['CreatedDateInt'];
    createdDateReal = json['CreatedDateReal'];
    createdUser = json['CreatedUser'];
    description = json['Description'];
    if (json['DescriptionList'] != null) {
      json['DescriptionList'].forEach((v) {});
    }
    detailCounterScript = json['DetailCounterScript'];
    external = json['External'];
    haberVideo = json['HaberVideo'];
    hideArticleRightColumn = json['HideArticleRightColumn'];
    id = json['Id'];
    identityId = json['IdentityId'];
    isModified = json['IsModified'];
    listCounterScript = json['ListCounterScript'];
    modifiedDate = json['ModifiedDate'];
    nameForUrl = json['NameForUrl'];
    nameForUrl2 = json['NameForUrl2'];
    outputDate = json['OutputDate'];
    primaryImage = json['primaryImage'];
    primaryImageAlternateText = json['primaryImageAlternateText'];
    quickImageType = json['QuickImageType'];
    secondaryImage = json['secondaryImage'];
    secondaryImageAlternateText = json['secondaryImageAlternateText'];
    showWebView = json['ShowWebView'];
    sortOrderCurrent = json['SortOrderCurrent'];
    source = json['Source'];
    spot = json['Spot'];
    spotShort = json['SpotShort'];
    surmansetBaslik = json['SurmansetBaslik'];
    surmansetBaslikKategori = json['SurmansetBaslikKategori'];
    title = json['Title'];
    titleShort = json['TitleShort'];
    url = json['Url'];
    usedMethod = json['UsedMethod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ArticleId'] = articleId;
    data['ArticleSourceId'] = articleSourceId;
    if (articleSourceInfo != null) {
      data['ArticleSourceInfo'] =
          articleSourceInfo!.map((v) => v.toJson()).toList();
    }
    data['ArticleSourceType'] = articleSourceType;
    data['ArticleType'] = articleType;
    data['CanUserWriteComments'] = canUserWriteComments;
    data['CategoryId'] = categoryId;
    data['CategoryName'] = categoryName;
    data['CreatedDate'] = createdDate;
    data['CreatedDateInt'] = createdDateInt;
    data['CreatedDateReal'] = createdDateReal;
    data['CreatedUser'] = createdUser;
    data['Description'] = description;
    data['DetailCounterScript'] = detailCounterScript;
    data['External'] = external;
    data['HaberVideo'] = haberVideo;
    data['HideArticleRightColumn'] = hideArticleRightColumn;
    data['Id'] = id;
    data['IdentityId'] = identityId;
    data['IsModified'] = isModified;
    data['ListCounterScript'] = listCounterScript;
    data['ModifiedDate'] = modifiedDate;
    data['NameForUrl'] = nameForUrl;
    data['NameForUrl2'] = nameForUrl2;
    data['OutputDate'] = outputDate;
    data['primaryImage'] = primaryImage;
    data['primaryImageAlternateText'] = primaryImageAlternateText;
    data['QuickImageType'] = quickImageType;
    data['secondaryImage'] = secondaryImage;
    data['secondaryImageAlternateText'] = secondaryImageAlternateText;
    data['ShowWebView'] = showWebView;
    data['SortOrderCurrent'] = sortOrderCurrent;
    data['Source'] = source;
    data['Spot'] = spot;
    data['SpotShort'] = spotShort;
    data['SurmansetBaslik'] = surmansetBaslik;
    data['SurmansetBaslikKategori'] = surmansetBaslikKategori;
    data['Title'] = title;
    data['TitleShort'] = titleShort;
    data['Url'] = url;
    data['UsedMethod'] = usedMethod;
    return data;
  }
}

class ArticleSourceInfo {
  String? id;
  String? primaryImage;
  String? source;
  String? sourceForUrl;
  String? type;

  ArticleSourceInfo(
      {this.id, this.primaryImage, this.source, this.sourceForUrl, this.type});

  ArticleSourceInfo.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    primaryImage = json['primaryImage'];
    source = json['Source'];
    sourceForUrl = json['SourceForUrl'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['primaryImage'] = primaryImage;
    data['Source'] = source;
    data['SourceForUrl'] = sourceForUrl;
    data['Type'] = type;
    return data;
  }
}
