// ignore_for_file: unnecessary_question_mark, prefer_void_to_null

import 'package:haber_app/models/base_model_abstract_class.dart';

class NewsTicker extends BaseModel {
  Meta? meta;
  Data? data;
  Pagination? pagination;

  NewsTicker({this.meta, this.data, this.pagination});

  NewsTicker.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
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
  List<ArticleSourceInfo>? articleSourceInfo;
  String? categoryName;
  String? createdDate;
  String? createdDateReal;
  String? description;
  String? external;
  String? id;
  String? modifiedDate;
  String? outputDate;
  String? primaryImage;
  String? primaryImageAlternateText;
  String? secondaryImage;
  String? secondaryImageAlternateText;
  bool? showWebView;
  String? source;
  String? spot;
  bool? surmansetBaslik;
  String? title;
  String? titleShort;
  String? url;
  bool? usedMethod;

  Response(
      {this.articleId,
      this.articleSourceInfo,
      this.categoryName,
      this.createdDate,
      this.createdDateReal,
      this.description,
      this.external,
      this.id,
      this.modifiedDate,
      this.outputDate,
      this.primaryImage,
      this.primaryImageAlternateText,
      this.secondaryImage,
      this.secondaryImageAlternateText,
      this.showWebView,
      this.source,
      this.spot,
      this.surmansetBaslik,
      this.title,
      this.titleShort,
      this.url,
      this.usedMethod});

  Response.fromJson(Map<String, dynamic> json) {
    articleId = json['ArticleId'];
    if (json['ArticleSourceInfo'] != null) {
      articleSourceInfo = <ArticleSourceInfo>[];
      json['ArticleSourceInfo'].forEach((v) {
        articleSourceInfo!.add(ArticleSourceInfo.fromJson(v));
      });
    }
    categoryName = json['CategoryName'];
    createdDate = json['CreatedDate'];
    createdDateReal = json['CreatedDateReal'];
    description = json['Description'];
    external = json['External'];
    id = json['Id'];
    modifiedDate = json['ModifiedDate'];
    outputDate = json['OutputDate'];
    primaryImage = json['primaryImage'];
    primaryImageAlternateText = json['primaryImageAlternateText'];
    secondaryImage = json['secondaryImage'];
    secondaryImageAlternateText = json['secondaryImageAlternateText'];
    showWebView = json['ShowWebView'];
    source = json['Source'];
    spot = json['Spot'];
    surmansetBaslik = json['SurmansetBaslik'];
    title = json['Title'];
    titleShort = json['TitleShort'];
    url = json['Url'];
    usedMethod = json['UsedMethod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ArticleId'] = articleId;
    if (articleSourceInfo != null) {
      data['ArticleSourceInfo'] =
          articleSourceInfo!.map((v) => v.toJson()).toList();
    }
    data['CategoryName'] = categoryName;
    data['CreatedDate'] = createdDate;
    data['CreatedDateReal'] = createdDateReal;
    data['Description'] = description;
    data['External'] = external;
    data['Id'] = id;
    data['ModifiedDate'] = modifiedDate;
    data['OutputDate'] = outputDate;
    data['primaryImage'] = primaryImage;
    data['primaryImageAlternateText'] = primaryImageAlternateText;
    data['secondaryImage'] = secondaryImage;
    data['secondaryImageAlternateText'] = secondaryImageAlternateText;
    data['ShowWebView'] = showWebView;
    data['Source'] = source;
    data['Spot'] = spot;
    data['SurmansetBaslik'] = surmansetBaslik;
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

class Pagination {
  Null? previousUrl;
  String? nextUrl;

  Pagination({this.previousUrl, this.nextUrl});

  Pagination.fromJson(Map<String, dynamic> json) {
    previousUrl = json['previous_url'];
    nextUrl = json['next_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['previous_url'] = previousUrl;
    data['next_url'] = nextUrl;
    return data;
  }
}
